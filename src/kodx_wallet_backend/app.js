const express = require("express");
const morgan = require("morgan");
const responseTime = require("response-time");
const authRoutes = require("./routes/auth/auth_routers");
const dotenv = require("dotenv");
const validateToken = require("./middlewares/auth/validate_token");

dotenv.config();

// middle-wares
const app = express();
app.use(express.json());
app.use(responseTime());
app.use(morgan("dev"));

// authentication
app.use("/auth", authRoutes);

// user
app.use("/user", validateToken, (req, res) => {
  res.json({ status: "success" });
});

// start server
app.listen(3000, () => {
  console.log("Express server listening on port 3000!");
});
