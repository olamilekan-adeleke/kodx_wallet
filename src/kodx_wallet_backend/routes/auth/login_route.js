const checkUserExist = require("../../controllers/auth/check_if_user_exist");
const comparePassword = require("../../controllers/auth/compare_password");
const generateToken = require("../../controllers/auth/generate_token");

const loginRoute = async (req, res) => {
  try {
    const { email, password } = req.body;
    // check if user exist
    const userData = await checkUserExist(email);

    // compare password with hashed password in db
    await comparePassword(password, userData.password);

    // TODO: update user last login

    // send back user details and token
    const token = await generateToken(userData.user_id);

    res.status(200).json({
      status: "success",
      msg: "Login Successful!",
      data: userData,
      token,
    });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something went wrong!" });
  }
};

module.exports = loginRoute;
