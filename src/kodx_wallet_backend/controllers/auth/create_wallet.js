const { walletCollectionRef } = require("../firebase/firebase_admin");

const CreateWalletForNewUser = async (userId) => {
  const dateObj = new Date();
  const month = dateObj.getMonth() + 1;
  const year = dateObj.getFullYear();

  await walletCollectionRef.doc(userId).set({
    balance: 0,
  });

  await walletCollectionRef
    .doc(userId)
    .collection(`${year}`)
    .doc(`${month}`)
    .set({
      total_sent: 0,
      total_received: 0,
    });

  console.log("wallet Created!");
};

module.exports = CreateWalletForNewUser;
