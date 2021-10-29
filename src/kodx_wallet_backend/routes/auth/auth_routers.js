const authRouter = require("express").Router();
const signupRoute = require("./sign_up_route");
const loginRoute = require("./login_route");
const forgotPassword = require("./forgot_password");
const resetPassword = require("./reset_password");

authRouter.post("/signup", signupRoute);

authRouter.post("/login", loginRoute);

authRouter.post("/forgot-password", forgotPassword);

authRouter.post("/reset-password", resetPassword);

module.exports = authRouter;
