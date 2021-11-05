const walletRouter = require("express").Router();
const getWallet = require("./get_wallet");
const validateToken = require("../../middlewares/auth/validate_token");

walletRouter.get("/", validateToken, getWallet);

module.exports = walletRouter;
