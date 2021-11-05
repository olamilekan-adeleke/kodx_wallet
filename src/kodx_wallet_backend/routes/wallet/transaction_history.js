const getTransactionHistory = require("../../controllers/wallet/get_transaction_history");

const transactionHistory = async (req, res) => {
  try {
    const userId = req.decoded.id;
    const { last_username } = req.query;

    console.log(query);
    console.log(last_username);

    if (!query) {
      throw {
        code: 400,
        msg: "Search Query Needed!!",
      };
    }

    const users = await getSearchUser(query, last_username);

    if (users === undefined || users.length === 0) {
      throw {
        code: 404,
        msg: "User not found!",
      };
    }
    res.status(200).json({
      status: "success",
      msg: users.length + " User Fetched",
      data: users,
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
