const {
  userCollectionRef,
} = require("../../controllers/firebase/firebase_admin");

const getSearchUser = async (searchQuery, lastUsername, limit) => {
  limit = limit ?? 10;
  let users = [];

  if (!lastUsername) {
    const query = await userCollectionRef
      .orderBy("username")
      .where("search_key", "array-contains", searchQuery)
      .limit(parseInt(limit))
      .get();

    users = query.docs.map((doc) => doc.data());
  } else {
    const query = await userCollectionRef
      .orderBy("username")
      .where("search_key", "array-contains", searchQuery)
      .startAfter(lastUsername)
      .limit(parseInt(limit))
      .get();

    users = query.docs.map((doc) => doc.data());
  }

  console.log(users);
  return users;
};

module.exports = getSearchUser;
