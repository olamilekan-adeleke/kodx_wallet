const { walletCollectionRef } = require("../firebase/firebase_admin");

const fetchWalletDetails = async (userId) => {
    const data = await walletCollectionRef.doc(userId).get();

    if (!data) {
      throw {
        code: 404,
        msg: "User Wallet Data not found!",
      };
    } else {
      const userWalletData = data.data();
      console.log(userWalletData);
      return userWalletData;
    }

};

module.exports = fetchWalletDetails;
