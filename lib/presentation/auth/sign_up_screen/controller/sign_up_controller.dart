//
// @Author: "Eldor Turgunov"
// @Date: 17.02.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../models/sign_up_model.dart';

enum UserType {
  client,
  doctor,
}

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserType? userType;

  void selectUserType(UserType type) {
    userType = type;
    update();
  }

  Future<void> signUp(String email, String password, UserType userType) async {
    try {
      // Authentication
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firestore Insertion
      final signUpModel = SignUpModel(
        uid: userCredential.user!.uid,
        email: email,
        userType: userType.toString().split('.').last,
        createdAt: Timestamp.now(),
      );

      // Conditional Save
      if (userType == UserType.client) {
        await _firestore
            .collection('userClients')
            .doc(userCredential.user!.uid)
            .set(signUpModel.toMap()); // Assuming you add toMap()
      } else if (userType == UserType.doctor) {
        await _firestore
            .collection('userDoctors')
            .doc(userCredential.user!.uid)
            .set(signUpModel.toMap());
      } else {
        // Handle unexpected UserType (error or future expansion)
      }
      await _firestore
          .collection('userTypes')
          .doc(userCredential.user!.uid)
          .set({'userType': userType.toString().split('.').last});

      Get.offAllNamed(AppRoutes.navigationPage);
      Get.snackbar(
        'Success',
        'User created successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade400,
        colorText: Colors.white,
      );
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
