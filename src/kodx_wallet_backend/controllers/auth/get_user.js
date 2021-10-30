const { userCollectionRef } = require("../firebase/firebase_admin");

const getUser = async (userId) => {
  const data = await userCollectionRef.doc(userId).get();

  if (!data) {
    throw {
      code: 400,
      msg: `User Data not found!`,
    };
  } else {
    const user = data.data();
    console.log(user);
    return user;
  }
};

module.exports = getUser;
