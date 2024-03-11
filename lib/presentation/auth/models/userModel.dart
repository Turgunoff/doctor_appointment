//
// @Author: "Eldor Turgunov"
// @Date: 10.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String password;
  final String userType;
  final Timestamp createdAt;
  // Add more fields as needed:
  String? userName;
  String? photoURL;
  String? userSex;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.userType,
    required this.createdAt,
    this.userName,
    this.photoURL,
    this.userSex,
  });

  // Method to convert Firestore data to UserModel
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      password: data['password'],
      userType: data['userType'],
      createdAt: data['createdAt'],
      userName: data['userName'],
      photoURL: data['photoURL'],
      userSex: data['userSex'],
    );
  }
}