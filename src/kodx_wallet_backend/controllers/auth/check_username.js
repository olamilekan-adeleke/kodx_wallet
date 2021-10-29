const { firestoreDatabase } = require("../firebase/firebase_admin");

checkUsernameExist = async (username) => {
  const userCollectionRef = firestoreDatabase.collection("users");
  const snapshot = await userCollectionRef
    .where("username", "==", username)
    .get();

  if (snapshot.empty) {
    return;
  } else {
    throw {
      code: 400,
      msg: `Username '${username} is Already Taken!`,
    };
  }
};

module.exports = checkUsernameExist;
