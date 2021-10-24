const express = require("express");
const authRoutes = require("./routes/auth/auth_routers");

const app = express();
app.use(express.json());

// authentication

app.use("/", authRoutes);

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
