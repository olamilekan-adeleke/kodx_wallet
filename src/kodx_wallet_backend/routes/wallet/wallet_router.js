const walletRouter = require("express").Router();
const getWallet = require("./get_wallet");
const fundWallet = require("./fund_wallet");
const validateToken = require("../../middlewares/auth/validate_token");

walletRouter.get("/", validateToken, getWallet);
walletRouter.get("/fund", validateToken, fundWallet);

module.exports = walletRouter;
