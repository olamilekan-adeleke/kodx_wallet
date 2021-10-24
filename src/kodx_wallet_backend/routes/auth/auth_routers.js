const authRouter = require("express").Router();
const validateUserDetails = require("../../controllers/validate_signup_details");
const checkEmailExist = require("../../controllers/auth/check_email_exist");
const checkPhoneExist = require("../../controllers/auth/check_phone");
const checkUsernameExist = require("../../controllers/auth/check_username");
const hashPassword = require("../../controllers/auth/hash_password");
const saveUserToDB = require("../../controllers/auth/save_user");

authRouter.post("/login", (req, res) => {
  res.send("login route");
});

authRouter.post("/signup", async (req, res) => {
  try {
    //check if email is valid and password is correct
    // check if other details are present
    validateUserDetails(req.body);

    // check data base to see if email is not already used
    await checkEmailExist(req.body.email);

    // check username
    await checkUsernameExist(req.body.username);

    // check phone number
    await checkPhoneExist(req.body.phone);

    // hash password
    password = await hashPassword(req.body.password);

    // save user data to database
    await saveUserToDB(req.body);

    res.status(201).json({ status: "success", msg: "User Created!" });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something went wrong!" });
  }
});

module.exports = authRouter;
