const admin = require("firebase-admin");
require("dotenv").config();

const serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_KEY);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firestoreDatabase = admin.firestore();

const fieldValue = admin.firestore.FieldValue;

const userCollectionRef = firestoreDatabase.collection("users");
const walletCollectionRef = firestoreDatabase.collection("wallets");
const transactionCollectionRef = firestoreDatabase.collection("transactions");

module.exports = {
  fieldValue,
  userCollectionRef,
  walletCollectionRef,
  transactionCollectionRef,
};
