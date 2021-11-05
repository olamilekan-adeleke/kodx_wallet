const { transactionCollectionRef } = require("../firebase/firebase_admin");

const addTransactionToHistory = async (userId) => {
  try {
    console.log(userId);
    await transactionCollectionRef.doc(userId).collection("history").add({});
  } catch (err) {
    console.log(err);
    throw {
      code: 500,
      msg: "Unable To Add Transaction To History!",
    };
  }
};

module.exports = addTransactionToHistory;
