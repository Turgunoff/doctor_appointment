//
// @Author: "Eldor Turgunov"
// @Date: 20.03.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  List<String> items = ['Female', 'Male'];
  String selectedItem = 'Female';

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var birthdayController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> editProfile() async {
    try {
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final email = emailController.text.trim();
      final birthday = birthdayController.text.trim();
      final phone = phoneController.text.trim();
      final isVerified = true;
      // ... get values from other controllers ...

      // Prepare data object (using Map example)
      final data = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birthday': birthday,
        'phoneNumber': phone,
        'isVerified': isVerified
        // ... add other fields like dateOfBirth, gender, phoneNumber ...
      };

      // Save data to Firestore
      await _firestore
          .collection('userClients')
          .doc(_auth.currentUser!.uid)
          .set(data);

      Get.snackbar(
        'Success',
        'Profile updated successfully!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Clear text fields after successful save (optional)
      firstNameController.text = '';
      lastNameController.text = '';
      emailController.text = '';
      birthdayController.text = '';
      phoneController.text = '';
      // ... clear other controllers ...
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
