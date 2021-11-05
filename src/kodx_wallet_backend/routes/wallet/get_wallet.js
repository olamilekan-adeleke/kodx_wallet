const fetchWalletDetails = require("../../controllers/wallet/get_wallet_details");

const getWallet = async (req, res) => {
  try {
    res.status(200).json({ status: "success" });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something went wrong!" });
  }
};

module.exports = getWallet;
