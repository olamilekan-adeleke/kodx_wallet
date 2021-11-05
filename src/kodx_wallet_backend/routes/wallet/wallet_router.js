const walletRouter = require("express").Router();
const getWallet = require("./get_wallet");
const fundWallet = require("./fund_wallet");
const validateToken = require("../../middlewares/auth/validate_token");
const transactionHistory = require("./transaction_history");

walletRouter.get("/", validateToken, getWallet);

walletRouter.get("/fund", validateToken, fundWallet);

walletRouter.get("/history", validateToken, transactionHistory);

module.exports = walletRouter;
