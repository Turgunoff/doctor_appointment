//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../auth/sign_up_screen/models/sign_up_model.dart';
import '../models/profile_model.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;

  final Rx<ProfileModel> userProfile = ProfileModel().obs;

  @override
  void onInit() {
    super.onInit();
    user = _auth.currentUser;
    getUserData();
  }

  //getUserData
  Future<void> getUserData() async {
    try {
      final snapshot =
          await _firestore.collection('userClients').doc(user!.uid).get();
      if (snapshot.exists) {
        userProfile.value = ProfileModel.fromFirestore(snapshot);
      }
    } catch (error) {
      print('Error fetching user profile: $error');
    }
    _firestore
        .collection('userClients')
        .doc(user!.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        userProfile.value = ProfileModel.fromFirestore(snapshot);
      }
    });
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
