const jwt = require("jsonwebtoken");

const validateToken = async (req, res, next) => {
  let token =
    (req.headers["x-access-token"] || req.headers["authorization"]) ?? "";

  token = token.replace(/^Bearer\s+/, "");

  if (token) {
    jwt.verify(token, process.env.TOKEN_KEY, (err, decoded) => {
      if (err) {
        return res.status(403).send({
          status: "fail",
          msg: "Error Validating Token!",
        });
      }
      console.log(decoded);

      req.decoded = decoded;
      next();
    });
  } else {
    return res.status(403).send({
      status: "fail",
      msg: "Token not provided!",
    });
  }
};

module.exports = validateToken;
