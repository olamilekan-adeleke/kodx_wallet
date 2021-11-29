import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/instance_manager.dart';

import '../../../cores/utils/local_database_controller.dart';
import '../../../features/auth/model/user_details_model.dart';

class AuthenticationRepo {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final LocalDatabaseController localDatabaseController =
      Get.find<LocalDatabaseController>();
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

  

  Future<void> registerUserWithEmailAndPassword(
    UserDetailsModel userDetails,
    String password,
  ) async {
    // final UserCredential userCredential =
    //     await _firebaseAuth.createUserWithEmailAndPassword(
    //   email: userDetails.email,
    //   password: password,
    // );

    // final User? user = userCredential.user;

    // if (user == null) throw Exception('Opps, an error occured!');

    // userDetails = userDetails.copyWith(uid: user.uid);

    // // TODO: add phone number check

    // infoLog('userCredential: ${user.uid}', title: 'user sign up');

    // await addUserDataToFirestore(userDetails);

    // await NotificationMethods.subscribeToTopice(user.uid);

    // await localDatabaseController
    //     .saveUserDataToLocalDB(userDetails.toMapForLocalDb());
  }

  Future<void> resetPassword(String email) async {
    // await _firebaseAuth.sendPasswordResetEmail(email: email);
    // infoLog('user email: $email', title: 'reset password');
  }

  Future<void> signOut() async {
   
  }


  
}
