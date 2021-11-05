const { transactionCollectionRef } = require("../firebase/firebase_admin");

const addTransactionToHistory = async (userId, amount) => {
  try {
    console.log(userId);
    await transactionCollectionRef.doc(userId).collection("history").add({
      timestamp: Date.now(),
      header: "fund wallet",
      msg: "You Have Successfully Fund Your Wallet",
      method: "paystack",
      transaction_type: "credit",
      amount,
    });
  } catch (err) {
    console.log(err);
    throw {
      code: 500,
      msg: "Unable To Add Transaction To History!",
    };
  }
};

module.exports = addTransactionToHistory;
