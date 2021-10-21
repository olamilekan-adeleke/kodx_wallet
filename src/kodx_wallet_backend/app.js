const express = require("express");

const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    
  res.status(200).json({
    status: "success",
    msg: "Working fine",
  });
});

app.listen(3000, () => {
  console.log("Express server listening on port 3000!");
});
