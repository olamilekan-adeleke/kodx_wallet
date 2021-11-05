const getTransactionHistory = require("../../controllers/wallet/get_transaction_history");

const transactionHistory = async (req, res) => {
  try {
    const userId = req.decoded.id;
    const { last_doc_timestamp, limit } = req.query;

    console.log(last_doc_timestamp);
    console.log(limit);

    const history = await getTransactionHistory(
      userId,
      last_doc_timestamp,
      limit
    );

    if (history === undefined || history.length === 0) {
      throw {
        code: 404,
        msg: "Transactions not found!",
      };
    }
    res.status(200).json({
      status: "success",
      msg: history.length + " Transactions Fetched",
      data: history,
    });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something went wrong!" });
  }
};

module.exports = transactionHistory;
