const express = require("express");
const responseTime = require("response-time");
const authRoutes = require("./routes/auth/auth_routers");

// middle-wares
const app = express();
app.use(express.json());
app.use(responseTime());

// authentication
app.use("/auth", authRoutes);

// test
app.get("/home", (req, res) => {
  res.status(200).json({
    status: "success",
    msg: "Working fine",
  });
});

app.listen(3001, () => {
  console.log("Express server listening on port 3000!");
});
