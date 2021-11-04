const express = require("express");
const morgan = require("morgan");
const responseTime = require("response-time");
const authRoutes = require("./routes/auth/auth_routers");
const notFound = require("./controllers/not_found");
const userRoute = require("./routes/user/user_route");
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

// not found
app.use("/", notFound);

// start server
app.listen(process.env.PORT || 5000, () => {
  console.log("Express server listening on port 5000!");
});

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2OTI1YTRmLTJiMjMtNGFhMi1iYTg1LWI2M2QxMTFmMWI3MyIsImlhdCI6MTYzNjAzMTg4MCwiZXhwIjoxNjM2MDM5MDgwfQ.S8Urm4AKub-kUwmr-syd2WdIgcXvLjLDR1WJjAQ7RLM
