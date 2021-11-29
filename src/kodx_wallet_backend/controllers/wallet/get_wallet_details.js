const { walletCollectionRef } = require("../firebase/firebase_admin");

const fetchWalletDetails = async (userId) => {
  const dateObj = new Date();
  const month = dateObj.getMonth() + 1;
  const year = dateObj.getFullYear();

  const data = await walletCollectionRef.doc(userId).get();
  const stat = await walletCollectionRef
    .doc(userId)
    .collection(`${year}`)
    .doc(`${month}`)
    .get();

  if (!data || !stat) {
    throw {
      code: 404,
      msg: "User Wallet Data not found!",
    };
  } else {
    const balanceData = data.data();
    const statData = stat.data();

    const userWalletData = { ...balanceData, ...statData };

    console.log(userWalletData);
    return userWalletData;
  }
};

module.exports = fetchWalletDetails;
