const { firestoreDatabase } = require("../firebase/firebase_admin");
const { v4: uuidv4 } = require("uuid");

const saveUserToDB = async (data) => {
  const { email, password, fullname, phone, username } = data;
  const userCollectionRef = firestoreDatabase.collection("users");
  const userId = uuidv4();

  await userCollectionRef.doc(userId).set({
    email,
    password,
    fullname,
    phone,
    username,
    user_id: userId,
  });
};

module.exports = saveUserToDB;
