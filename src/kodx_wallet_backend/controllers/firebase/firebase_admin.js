const admin = require("firebase-admin");

const serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_KEY);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firestoreDatabase = admin.firestore();
const userCollectionRef = firestoreDatabase.collection("users");

module.exports = { userCollectionRef };
