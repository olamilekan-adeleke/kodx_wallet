const express = require("express");
const morgan = require("morgan");
const responseTime = require("response-time");

const notFoundRoute = require("./controllers/not_found");
const authRoutes = require("./routes/auth/auth_routers");
const userRoute = require("./routes/user/user_route");
const walletRoutes = require("./routes/wallet/wallet_router");

const dotenv = require("dotenv");

dotenv.config();

// middle-wares
const app = express();
app.use(express.json());
app.use(responseTime());
app.use(morgan("dev"));

// authentication
app.use("/auth", authRoutes);

// user
app.use("/user", userRoute);

// wallet
app.use("/wallet", walletRoutes);

// not found
app.use("/", notFoundRoute);

// start server
app.listen(process.env.PORT || 5000, () => {
  console.log("Express server listening on port 5000!");
});
