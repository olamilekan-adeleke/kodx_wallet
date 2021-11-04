const getSearchUser = require("../../controllers/user/get_search_user");

const searchUsers = async (req, res) => {
  try {
    const userId = req.decoded.id;
    const { last_user_id, query } = req.query;

    console.log(query);

    if (!query) {
      throw {
        code: 400,
        msg: "Search Query Needed!!",
      };
    }

    const users = await getSearchUser(query, last_user_id);

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

module.exports = searchUsers;

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwMzI2NjU1LWIxMjUtNDM4MS1hNTk1LTE5NTRkMjEyNjdiOSIsImlhdCI6MTYzNjA1NzgzMywiZXhwIjoxNjM2MDY1MDMzfQ.iTHo6H9hnMflPiHPP70HtasUqVnFZ0igdPfj-Jq__hM
