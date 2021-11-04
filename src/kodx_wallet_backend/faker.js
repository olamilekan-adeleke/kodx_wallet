var faker = require("faker");
const saveUserToDB = require("./controllers/auth/save_user");

const generate = async () => {
  for (i = 0; i < 20; i++) {
    const user = {
      fullname: faker.name.findName(),
      email: faker.internet.email(),
      phone: faker.phone.phoneNumber(),
      username: faker.internet.userName(),
      password: "test123456",
      search_key: searchKey,
    };

    await saveUserToDB(user);
    console.log(`user ${i} added`);
  }
};

generate();
