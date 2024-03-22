//
// @Author: "Eldor Turgunov"
// @Date: 20.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileModel {
  String? firstName;
  String? lastName;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? phoneNumber;
  bool? isVerified;

  EditProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.phoneNumber,
    this.isVerified,
  });

  factory EditProfileModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return EditProfileModel(
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      dateOfBirth: data['dateOfBirth'],
      gender: data['gender'],
      phoneNumber: data['phoneNumber'],
      isVerified: data['isVerified'],
    );
  }
}
