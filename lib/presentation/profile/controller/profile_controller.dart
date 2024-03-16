//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../auth/sign_up_screen/models/signUpModel.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<SignUpModel>? userType = Rxn<SignUpModel>();
  User? user;

  @override
  void onInit() {
    super.onInit();
    user = _auth.currentUser;
    getUserData();
  }

  Future<void> getUserData() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) return;

    try {
      final collection = firebaseUser.email!.contains('client') ? 'userClients' : 'userDoctors';
      final userDocSnapshot = await FirebaseFirestore.instance
          .collection(collection)
          .doc(firebaseUser.uid)
          .get();

      if (userDocSnapshot.exists) {
        userType?.value = SignUpModel.fromFirestore(userDocSnapshot);
      } else {
        // Handle the case when there's no user document
      }
    } catch (e) {
      Get.snackbar(
        'Error Fetching Data',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 15),
      );
    }
  }

  void logOut() async {
    try {
      await _auth.signOut();
      Get.defaultDialog(
        title: 'Log Out',
        middleText: 'Are you sure you want to log out?',
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        buttonColor: Colors.red,
        confirm: CustomButton(
            height: 50,
            width: double.infinity,
            textButton: 'Yes',
            color: Colors.red,
            onPressed: () {
              _auth.signOut();
              Get.offAllNamed(AppRoutes.navigationPage);
            }),
        cancel: CustomButton(
          height: 50,
          width: double.infinity,
          textButton: 'Cancel',
          onPressed: () {
            Get.back();
          },
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
