const {
  transactionCollectionRef,
} = require("../../controllers/firebase/firebase_admin");

const getSearchUser = async (searchQuery, lastUsername) => {
  const limit = 5;
  let users = [];

  if (!lastUsername) {
    const query = await transactionCollectionRef
      .orderBy("username")
      .where("search_key", "array-contains", searchQuery)
      .limit(limit)
      .get();

    users = query.docs.map((doc) => doc.data());
  } else {
    const query = await transactionCollectionRef
      .orderBy("username")
      .where("search_key", "array-contains", searchQuery)
      .startAfter(lastUsername)
      .limit(limit)
      .get();

    users = query.docs.map((doc) => doc.data());
  }

  console.log(users);
  return users;
};

module.exports = getSearchUser;
