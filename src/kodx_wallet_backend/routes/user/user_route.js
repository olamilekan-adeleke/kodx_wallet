const userRoute = require("express").Router();
const validateToken = require("../../middlewares/auth/validate_token");
const getUserDetails = require("./get_user");
const deleteUser = require("./delete_user");
const searchUsers = require("./search_users");
const editUser = require("./edit_user");

userRoute.get("/", validateToken, getUserDetails);
userRoute.post("/", validateToken, editUser);
userRoute.post("/delete", validateToken, deleteUser);
userRoute.get("/search", validateToken, searchUsers);

module.exports = userRoute;
