const notFoundRoutes = (req, res) => {
  res.status(404).json({
    status: "fail",
    msg: "Sorry Couldn't Find That Route!",
  });
};

module.exports = notFoundRoutes;
