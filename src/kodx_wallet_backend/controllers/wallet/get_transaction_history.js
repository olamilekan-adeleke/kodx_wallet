const {
  transactionCollectionRef,
} = require("../../controllers/firebase/firebase_admin");

const getTransactionHistory = async (userId, lastDocTimestamp, limit) => {
  limit = limit ?? 5;
  let history = [];

  if (!lastDocTimestamp) {
    const query = await transactionCollectionRef
      .doc(userId)
      .collection("history")
      .orderBy("timestamp")
      .limit(parseInt(limit))
      .get();

    history = query.docs.map((doc) => doc.data());
  } else {
    const query = await transactionCollectionRef
      .doc(userId)
      .collection("history")
      .orderBy("timestamp")
      .startAfter(lastDocTimestamp)
      .limit(parseInt(limit))
      .get();

    history = query.docs.map((doc) => doc.data());
  }

  console.log(history);
  return history;
};

module.exports = getTransactionHistory;
