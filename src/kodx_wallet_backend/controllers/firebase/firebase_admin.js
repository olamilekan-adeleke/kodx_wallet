const admin = require("firebase-admin");

const serviceAccount = require("../../serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firestoreDatabase = admin.firestore();

module.exports = { admin, firestoreDatabase };