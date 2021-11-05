const sendFundRoutes = require("express").Router();
const validateToken = require("../../middlewares/auth/validate_token");
const sendFundByUsername = require("./send_by_username");
const sendFundByBank = require("./send_by_bank");

sendFundRoutes.post("/username", validateToken, sendFundByUsername);

sendFundRoutes.post("/bank", validateToken, sendFundByBank);

module.exports = sendFundRoutes;
