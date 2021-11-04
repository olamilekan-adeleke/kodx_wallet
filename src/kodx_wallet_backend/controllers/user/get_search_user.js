const {
  userCollectionRef,
} = require("../../controllers/firebase/firebase_admin");

const getSearchUser = async (searchQuery, lastUserId) => {
  let user = [];

  if (!lastUserId) {
    const query = await userCollectionRef
      .orderBy("username")
      .where("username", "array-contains", searchQuery)
      .limit(10)
      .get();

    users = query.docs.map((doc) => doc.data());
  } else {
    const query = await userCollectionRef
      .orderBy("username")
      .where("username", "array-contains", searchQuery)
      .startAfter(lastUserId)
      .limit(10)
      .get();

    users = query.docs.map((doc) => doc.data());
  }

  console.log(users);
};

module.exports = getSearchUser;
