const walletRouter = require("express").Router();
const getWallet = require("./get_wallet");

walletRouter.get("/", getWallet);

module.exports = walletRouter;
