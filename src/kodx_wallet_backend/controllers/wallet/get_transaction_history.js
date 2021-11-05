const {
  transactionCollectionRef,
} = require("../../controllers/firebase/firebase_admin");

const getTransactionHistory = async (lastDocTimestamp) => {
  const limit = 5;
  let history = [];

  if (!lastUsername) {
    const query = await transactionCollectionRef
      .orderBy("timestamp")
      .limit(limit)
      .get();

    history = query.docs.map((doc) => doc.data());
  } else {
    const query = await transactionCollectionRef
      .orderBy("timestamp")
      .startAfter(lastDocTimestamp)
      .limit(limit)
      .get();

    history = query.docs.map((doc) => doc.data());
  }

  console.log(history);
  return history;
};

module.exports = getTransactionHistory;
