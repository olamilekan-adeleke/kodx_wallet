const updateUserData = require("../../controllers/auth/update_user_data");

const updateUser = async (req, res) => {
  const data = {};

  try {
    const userId = req.decoded.id;
    const { email, phone, fullname } = req.body;

    if (email) data.email = email;
    if (fullname) data.fullname = fullname;
    if (phone) data.phone = phone;

    if (!(email || fullname || phone)) {
      throw {
        code: 403,
        msg: "Please Pass User Data You Want To Update! \nYou Can Only Update Email, Phone Number and Full Name",
      };
    }

    console.log(data);

    await updateUserData(userId, data);

    res.status(200).json({
      status: "success",
      msg: "User Data Updated Successfully!",
    });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something went wrong!" });
  }
};

module.exports = updateUser;
