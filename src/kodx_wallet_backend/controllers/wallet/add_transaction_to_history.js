const { walletCollectionRef } = require("../firebase/firebase_admin");

const addTransactionToHistory = (userId, amount) => {
  await walletCollectionRef.doc(userId).set({});
};

module.exports = addTransactionToHistory;
