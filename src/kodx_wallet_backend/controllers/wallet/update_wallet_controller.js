const {
  walletCollectionRef,
  fieldValue,
} = require("../firebase/firebase_admin");

const updateWalletController = async (userId, amount) => {
  try {
    await walletCollectionRef
      .doc(userId)
      .update({ balance: fieldValue.increment(amount) });
  } catch (err) {
    throw {
      code: 500,
      msg: "Unable To Updated Wallet!",
    };
  }
};

module.exports = updateWalletController;
