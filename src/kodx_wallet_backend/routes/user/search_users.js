const getSearchUser = require("../../controllers/user/get_search_user");

const searchUsers = async (req, res) => {
  try {
    const userId = req.decoded.id;
    const { last_user_id } = req.body;

    const users = await getSearchUser(last_user_id);

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

module.exports = searchUsers;
