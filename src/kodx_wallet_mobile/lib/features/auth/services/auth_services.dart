import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kodx_wallet_mobile/cores/utils/api.dart';
import '../../../features/auth/model/user_details_model.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepo {
  final CollectionReference<dynamic> userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserDetailsModel? result;

    final Map<String, String> header = {"Content-Type": "application/json"};

    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    http.Response response = await http.post(
      Uri.parse(ApiEndpoints.login),
      headers: header,
      body: json.encode(body),
    );

    if (response.statusCode >= 500) {
      throw 'Unable to connect to server! \nSomething went wrong.';
    }

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (responseData['status'] == 'success') {
        return;
      } else {
        throw responseData['msg'];
      }
    } else {
      throw responseData['msg'];
    }
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
