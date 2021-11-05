const validateTransactionFormPayStack = require("../../controllers/wallet/validate_transaction");

const fundWallet = (req, res) => {
  try {
    const userId = req.decoded.id;
    const txId = req.query.txId;

    // check pay-stack to confirm transaction
    const amount = await validateTransactionFormPayStack(txId);

    // update user wallet by that amount
      

    // add transaction  to transaction history
    res.status(200).json({
      status: "success",
      msg: "Wallet Successfully Funded!",
    });
  } catch (err) {
    console.log(err);
    const error = err;

    res.status(error.code ?? 500).json({
      status: "fail",
      msg: error.msg ?? "Something Went Wrong!",
    });
  }
};

module.exports = fundWallet;
