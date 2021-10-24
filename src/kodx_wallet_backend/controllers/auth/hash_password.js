const bcrypt = require("bcrypt");

hashPassword = async (password) => {
  const hashedPassword = await bcrypt.hash(password, 10);

  console.log(password + " => " + hashedPassword);

  return hashedPassword;
};

module.exports = hashPassword;
