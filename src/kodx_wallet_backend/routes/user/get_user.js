const getUser = require("../../controllers/auth/get_user");

const getUserDetails = async (req, res) => {
  try {
    const userId = req.decoded.id;

    const data = await getUser(userId);

    res.status(200).json({
      status: "success",
      data,
    });
  } catch (err) {
    console.log(err);
    const error = err;

    res
      .status(error.code ?? 500)
      .json({ status: "fail", msg: error.msg ?? "Something went wrong!" });
  }
};

module.exports = getUserDetails;
