//
// @Author: "Eldor Turgunov"
// @Date: 10.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpModel {
  final String uid;
  final String email;
  final Timestamp createdAt;
  final bool isVerified;

  SignUpModel({
    required this.uid,
    required this.email,
    required this.createdAt,
    required this.isVerified,
  });

  // Method to convert Firestore data to UserModel
  factory SignUpModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SignUpModel(
      uid: data['uid'],
      email: data['email'],
      createdAt: data['createdAt'],
      isVerified: data['isVerified'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'createdAt': createdAt,
      'isVerified': isVerified,
    };
  }
}
