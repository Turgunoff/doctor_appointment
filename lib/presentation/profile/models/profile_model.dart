//
// @Author: "Eldor Turgunov"
// @Date: 16.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  final String? uid;
  final String? email;
  final String? fullName;
  final bool? isVerified;
  final String? photoUrl;
  final String? phone;

  ProfileModel({
    this.uid,
    this.email,
    this.fullName,
    this.isVerified,
    this.photoUrl,
    this.phone,
  });

  factory ProfileModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProfileModel(
      email: data['email'],
      fullName: data['fullName'],
      isVerified: data['isVerified'],
      uid: doc.id, // Assuming the UID is the document ID
      photoUrl: data['photoUrl'],
      phone: data['phone'],
    );
  }
}
