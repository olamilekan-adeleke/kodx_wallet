import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:kod_chat/features/auth/model/user_details_model.dart';

class GenerateRandomUserFaker {
  static final CollectionReference userRef =
      FirebaseFirestore.instance.collection('users');
  
  // static final userCollectionRef =
  //     FirebaseDatabase.instance.reference().child('users');

  static Future<void> start() async {
    for (var i = 0; i < 100; i++) {
      bool addImage = i % 5 == 0;
      await _generateUsers(!addImage);
      log('User created | $i');
    }
  }

  static Future<void> _generateUsers(bool addImage) async {
    // final Faker faker = Faker();

    // final UserDetailsModel user = UserDetailsModel(
    //   uid: faker.internet.random.numberOfLength(12),
    //   email: faker.internet.email(),
    //   fullName: faker.person.name(),
    //   bio: faker.lorem.words(faker.randomGenerator.integer(50)).join(' '),
    //   phoneNumber: faker.phoneNumber.random.numberOfLength(11),
    //   dateJoined: Timestamp.now(),
    //   profilePicUrl: addImage
    //       ? faker.image.image(
    //           height: 500,
    //           width: 500,
    //           keywords: ['people', 'nature', 'sport', 'anime'],
    //           random: true,
    //         )
    //       : null,
    // );

    // await userRef.doc(user.uid).set(user.toMap());

    // await userCollectionRef.push().set({
    //     "fullName": faker.person.name(),
    //     "bio": faker.lorem.words(faker.randomGenerator.integer(50)).join(' '),
    //     "image": faker.image.image(random: true),
    // });
    // return;
  }
}
