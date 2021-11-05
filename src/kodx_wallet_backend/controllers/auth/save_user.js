const { userCollectionRef } = require("../firebase/firebase_admin");
const { v4: uuidv4 } = require("uuid");


var faker = require("faker");

const saveUserToDB = async (data) => {
  const { email, password, fullname, phone, username } = data;
  const userId = uuidv4();

  const searchKey = [];
  let currentLetter = "";

  username.split("").forEach((ele) => {
    currentLetter += ele.toLowerCase();
    searchKey.push(currentLetter);
  });

  

  await userCollectionRef.doc(userId).set({
    email,
    password,
    fullname,
    phone,
    username,
    user_id: userId,
    search_key: searchKey,
    imageUrl: faker.image.avatar(),
  });
};

module.exports = saveUserToDB;
