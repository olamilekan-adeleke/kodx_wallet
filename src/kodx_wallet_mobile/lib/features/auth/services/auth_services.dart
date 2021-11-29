import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kodx_wallet_mobile/cores/utils/api.dart';
import '../../../features/auth/model/user_details_model.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepo {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference<dynamic> userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    // final UserCredential userCredential =
    //     await _firebaseAuth.signInWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );

    // final User? user = userCredential.user;
    // infoLog('userCredential: ${user?.uid}', title: 'user log in');

    // final Map<String, dynamic> userData = await getLoggedInUser();
    // userData.remove('date_joined');
    // await localDatabaseController.saveUserDataToLocalDB(userData);
    // await NotificationMethods.subscribeToTopice(user!.uid);
  }

  Future<Map<String, dynamic>?> registerUserWithEmailAndPassword(
    UserDetailsModel userDetails,
    String password,
  ) async {
    Map<String, dynamic>? result;

    final Map<String, String> header = {"Content-Type": "application/json"};

    final Map<String, dynamic> body = {
      ...userDetails.toMap(),
      "password": password,
    };

    http.Response response = await http.post(
      Uri.parse(ApiEndpoints.signUp),
      headers: header,
      body: json.encode(body),
    );

    if (response.statusCode >= 500) {
      throw 'Unable to connect to server! \nSomething went wrong.';
    }

    result = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return result;
    } else {
      throw result!['msg'];
    }
  }

  Future<void> resetPassword(String email) async {
    // await _firebaseAuth.sendPasswordResetEmail(email: email);
    // infoLog('user email: $email', title: 'reset password');
  }

  Future<void> signOut() async {}
}
