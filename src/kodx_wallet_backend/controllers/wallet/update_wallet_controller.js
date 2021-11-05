const { walletCollectionRef } = require("../firebase/firebase_admin");

const updateWalletController = async (userId, amount) => {
  try {
    await walletCollectionRef.doc(userId).update({ balance: amount });
  } catch (err) {
    throw {
      code: 400,
    };
  }
};

module.exports = updateWalletController;
