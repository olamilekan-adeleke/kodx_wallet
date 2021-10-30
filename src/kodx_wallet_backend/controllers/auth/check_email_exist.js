const { userCollectionRef } = require("../firebase/firebase_admin");

checkEmailExist = async (email) => {
  
  const snapshot = await userCollectionRef.where("email", "==", email).get();

  if (snapshot.empty) {
    return;
  } else {
    snapshot.forEach((doc) => {
      console.log(doc.id, "=>", doc.data());
    });
    throw {
      code: 400,
      msg: `Email Address ${email} is Already Taken!`,
    };
  }
};

module.exports = checkEmailExist;
