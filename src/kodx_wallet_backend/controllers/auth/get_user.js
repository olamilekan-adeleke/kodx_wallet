const { userCollectionRef } = require("../firebase/firebase_admin");

// const checkUserExist = async (email) => {
//   const snapshot = await userCollectionRef.where("email", "==", email).get();

//   if (snapshot.empty) {
//     throw {
//       code: 400,
//       msg: `User not found!`,
//     };
//   } else {
//     const user = snapshot.docs[0].data();
//     console.log(user);
//     return user;
//   }
// };

// module.exports = checkUserExist;
