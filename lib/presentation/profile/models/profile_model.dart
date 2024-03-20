//
// @Author: "Eldor Turgunov"
// @Date: 16.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  // User Info
  final String? name;
  final String? surname;
  final String? email;
  final String? phone;
  final String? address;
  final String? photoUrl;
  final String? userType; // 'client', 'doctor', etc.

  // Authentication
  final String? uid;
  final bool isVerified;
  final bool isBlocked;
  final bool isOnline;
  final bool isDeleted;

  // Doctor Info (If applicable)
  final String? startWork;
  final String? endWork;
  final String? about;
  final String? speciality;
  final String? experience;
  final String? education;
  final String? price;
  final String? rating;
  final String? review;

  // Timestamps (Managed by Firestore)
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  ProfileModel({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.address,
    this.photoUrl,
    this.userType,
    this.uid,
    this.isVerified = false, // Default to not verified
    this.isBlocked = false,
    this.isOnline = false,
    this.isDeleted = false,
    this.startWork,
    this.endWork,
    this.about,
    this.speciality,
    this.experience,
    this.education,
    this.price,
    this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProfileModel(
      name: data['name'],
      surname: data['surname'],
      email: data['email'],
      uid: data['uid'] as String,

      // ... other fields ...
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // ... other fields ...
      'createdAt': FieldValue.serverTimestamp(), // Let Firestore manage
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
