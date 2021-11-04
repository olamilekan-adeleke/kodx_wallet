const notFound = (req, res) => {
  res.status(404).json({
    status: 404,
    msg: "Sorry Couldn't Find That Route!",
  });
};

module.exports = notFound;
