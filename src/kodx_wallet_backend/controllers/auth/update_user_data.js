const { userCollectionRef } = require("../firebase/firebase_admin");

const updateUserData = async (userId, data) => {
  try {
    await userCollectionRef.doc(userId).update(data);
  } catch (err) {
    throw {
      code: 400,
    };
  }
};

module.exports = updateUserData;
