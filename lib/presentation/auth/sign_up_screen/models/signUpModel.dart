//
// @Author: "Eldor Turgunov"
// @Date: 10.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpModel {
  final String uid;
  final String email;
  final String userType;
  final Timestamp createdAt;

  SignUpModel({
    required this.uid,
    required this.email,
    required this.userType,
    required this.createdAt,
  });

  // Method to convert Firestore data to UserModel
  factory SignUpModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SignUpModel(
      uid: data['uid'],
      email: data['email'],
      userType: data['userType'],
      createdAt: data['createdAt'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userType': userType,
      'createdAt': createdAt,
    };
  }
}
