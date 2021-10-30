const { userCollectionRef } = require("../firebase/firebase_admin");

checkPhoneExist = async (phone) => {
  const snapshot = await userCollectionRef.where("phone", "==", phone).get();

  if (snapshot.empty) {
    return;
  } else {
    snapshot.forEach((doc) => {
      console.log(doc.id, "=>", doc.data());
    });
    throw {
      code: 400,
      msg: `Phone Number '${phone}' is Already Taken!`,
    };
  }
};

module.exports = checkPhoneExist;
