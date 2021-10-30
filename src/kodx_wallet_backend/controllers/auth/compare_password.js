const bcrypt = require("bcrypt");

const comparePassword = async (password, hashedPassword) => {
  try {
    const match = await bcrypt.compare(password, hashedPassword);

    if (match) {
      return true;
    } else {
      throw {
        code: 400,
        msg: "Password Is Incorrect!",
      };
    }
  } catch (error) {
    throw {
      code: 400,
      msg: "Password Is Incorrect!",
    };
  }
};

module.exports = comparePassword;
