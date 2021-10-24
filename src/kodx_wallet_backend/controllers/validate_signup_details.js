validateSignupDetails = (data) => {
  const { email, password, fullname, phone } = data;

  if (email === undefined || !isEmail(email)) {
    throw {
      code: 500,
      msg: "Invalid email address!",
    };
  }

  if (password === undefined || password.length < 6) {
    throw {
      code: 500,
      msg: "Password Must be more min 6 characters!",
    };
  }

  if (fullname === undefined || fullname.length < 3) {
    throw {
      code: 500,
      msg: "Fullname Must be min 3 characters!",
    };
  }

  if (phone === undefined || phone.length < 11) {
    throw {
      code: 500,
      msg: "Must be more than 10 characters!!!",
    };
  }
};

var matcher =
  /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

function isEmail(string) {
  if (string.length > 320) return false;
  return matcher.test(string);
}

module.exports = validateSignupDetails;
