//
// @Author: "Eldor Turgunov"
// @Date: 16.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  final String? name;
  final String? surname;
  final String? email;
  final String? phone;
  final String? address;
  final String? photoUrl;
  final String? userType;
  final String? uid;
  final bool? isVerified;
  final bool? isBlocked;
  final bool? isOnline;
  final bool? isDeleted;
  final String? startWork;
  final String? endWork;
  final String? about;
  final String? speciality;
  final String? experience;
  final String? education;
  final String? price;
  final String? rating;
  final String? review;
  final String? createdAt;
  final String? updatedAt;

  ProfileModel({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.address,
    this.photoUrl,
    this.userType,
    this.uid,
    this.isVerified,
    this.isBlocked,
    this.isOnline,
    this.isDeleted,
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
      phone: data['phone'],
      address: data['address'],
      photoUrl: data['photoUrl'],
      userType: data['userType'],
      uid: data['uid'],
      isVerified: data['isVerified'],
      isBlocked: data['isBlocked'],
      isOnline: data['isOnline'],
      isDeleted: data['isDeleted'],
      startWork: data['startWork'],
      endWork: data['endWork'],
      about: data['about'],
      speciality: data['speciality'],
      experience: data['experience'],
      education: data['education'],
      price: data['price'],
      rating: data['rating'],
      review: data['review'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'address': address,
      'photoUrl': photoUrl,
      'userType': userType,
      'uid': uid,
      'isVerified': isVerified,
      'isBlocked': isBlocked,
      'isOnline': isOnline,
      'isDeleted': isDeleted,
      'startWork': startWork,
      'endWork': endWork,
      'about': about,
      'speciality': speciality,
      'experience': experience,
      'education': education,
      'price': price,
      'rating': rating,
      'review': review,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
