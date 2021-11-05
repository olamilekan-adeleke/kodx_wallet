const validateTransactionFormPayStack = async (txId) => {
  try {
    return 100;
  } catch (err) {
    throw {
      code: 400,
      msg: "Unable To Confirm Transaction!",
    };
  }
};

module.exports = validateTransactionFormPayStack;
