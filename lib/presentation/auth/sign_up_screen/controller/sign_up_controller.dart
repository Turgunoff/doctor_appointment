//
// @Author: "Eldor Turgunov"
// @Date: 17.02.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

enum UserType {
  client,
  doctor,
}

class SignUpController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserType? userType;

  void selectUserType(UserType type) {
    userType = type;
    update();
  }

  Future<void> signUp() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = userCredential.user;

      if (user != null) {
        // Add user to Firebase Firestore based on user type
        if (userType == UserType.client) {
          // Add client to Firebase Firestore
          await FirebaseFirestore.instance
              .collection('userClients')
              .doc(user.uid)
              .set({
            'uid' : user.uid,
            'email': user.email,
            'password': passwordController.text.trim(),
            'userType': userType.toString().split('.').last,
            'createdAt': Timestamp.fromDate(DateTime.now()),
          });
        } else if (userType == UserType.doctor) {
          // Add doctor to Firebase Firestore
          await FirebaseFirestore.instance
              .collection('userDoctors')
              .doc(user.uid)
              .set({
            'uid' : user.uid,
            'email': user.email,
            'password': passwordController.text.trim(),
            'userType': userType.toString().split('.').last,
            'createdAt': Timestamp.fromDate(DateTime.now()),
          });
        }
        Get.offAllNamed(AppRoutes.navigationPage);
        Get.snackbar(
          'Success',
          'User created successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.shade400,
          colorText: Colors.white,
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        colorText: Colors.white,
        backgroundColor: Colors.red.shade400,
        'Error',
        _getErrorMessage(e.code), // Helper function - see below
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
