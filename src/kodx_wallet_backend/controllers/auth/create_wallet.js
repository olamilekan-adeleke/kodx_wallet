const { walletCollectionRef } = require("../firebase/firebase_admin");

const CreateWalletForNewUser = async (userId) => {
  await walletCollectionRef.doc(userId).set({
    balance: 0,
    total_sent: 0,
    total_received: 0,
  });
  console.log("wallet Created!");
};

module.exports = CreateWalletForNewUser;
