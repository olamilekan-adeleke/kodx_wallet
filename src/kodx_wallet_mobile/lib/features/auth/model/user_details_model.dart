import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsModel {
  UserDetailsModel({
    required this.userId,
    required this.email,
    required this.fullName,
    this.bio,
    required this.phoneNumber,
    this.profilePicUrl,
    this.lastLogin,
  });

  factory UserDetailsModel.fromMap(Map<String, dynamic>? map) {
    return UserDetailsModel(
      userId: map!['user_id'].toString(),
      email: map['email'] as String,
      fullName: map['fullname'] as String,
      phoneNumber: map['phone'] as String,
      bio: map['bio'] == null
          ? 'Hey there am ${map['fullname']}'
          : map['bio'] as String,
      profilePicUrl:
          map['image_url'] != null ? map['image_url'] as String : null,
      lastLogin:
          map['last_login'] != null ? map['last_login'] as Timestamp : null,
    );
  }

  factory UserDetailsModel.fromJson(String source) =>
      UserDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String userId;
  final String email;
  final String fullName;
  final String? bio;
  final String phoneNumber;
  final String? profilePicUrl;
  final Timestamp? lastLogin;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'email': email,
      'fullname': fullName,
      'bio': bio,
      'phone': phoneNumber,
      'image_url': profilePicUrl,
      'last_login': lastLogin,
    };
  }

  Map<String, dynamic> toMapForLocalDb() {
    return <String, dynamic>{
      'user_id': userId,
      'email': email,
      'fullname': fullName,
      'bio': bio,
      'phone': phoneNumber,
      'image_url': profilePicUrl,
    };
  }

  String toJson() => json.encode(toMap());

  UserDetailsModel copyWith({
    String? userId,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? profilePicUrl,
    Timestamp? dateJoined,
  }) {
    return UserDetailsModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      lastLogin: dateJoined ?? this.lastLogin,
    );
  }

  @override
  String toString() {
    return 'UserDetailsModel(email: $email, fullName: $fullName, phoneNumber:'
        ' $phoneNumber, profilePicUrl: $profilePicUrl, dateJoined: $lastLogin)';
  }
}
