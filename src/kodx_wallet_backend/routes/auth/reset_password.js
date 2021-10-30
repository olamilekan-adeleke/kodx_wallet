const checkUserExist = require("../../controllers/auth/check_if_user_exist");
const comparePassword = require("../../controllers/auth/compare_password");
const updateUserData = require("../../controllers/auth/update_user_data");
const hashPassword = require("../../controllers/auth/hash_password");

const resetPassword = async (req, res) => {
  try {
    const { old_password, password, user_id } = req.body;

    if (old_password === password) {
      throw {
        code: 400,
        msg: "Old Password And New Password Must Not Be The Same!",
      };
    }

    // check if user exist
    const userData = await checkUserExist(email);

    // compare password with hashed password in db
    await comparePassword(old_password, userData.password);

    // hash new password
    const hashedPassword = await hashPassword(password);

    // update password
    await updateUserData(user_id, { password: hashedPassword });

    res.status(201).json({
      status: "success",
      msg: "Password Updated successfully!",
    });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something Went Wrong!" });
  }
};

module.exports = resetPassword;
