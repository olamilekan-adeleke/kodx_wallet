const authRouter = require("express").Router();
const validateUserDetails = require("../../controllers/validate_signup_details");

authRouter.post("/login", (req, res) => {
  res.send("login route");
});

authRouter.post("/signup", (req, res) => {
  try {
    // get user details
    const { email, password, fullname, phone, username } = req.body;

    //check if email is valid and password is correct
    // check if other details are present
    validateUserDetails(req.body);

    // check data base to see if email is not already used
    
    // hash password
    // save user data to database

    res.status(201).json({ status: "success", msg: "User Created!" });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? err });
  }
});

module.exports = authRouter;
