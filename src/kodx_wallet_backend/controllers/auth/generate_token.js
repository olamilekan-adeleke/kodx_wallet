const jwt = require("jsonwebtoken");

const generateToken = async (id) => {
  return jwt.sign({ id }, process.env.TOKEN_KEY, {
      expiresIn: "2h",
  });
};

module.exports = generateToken;
