//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:ui';

import 'package:doctor/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  var selectedLanguage = 'en_US'.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();

    user = _auth.currentUser;
  }

  void _loadLanguage() {
    if (box.hasData('language')) {
      selectedLanguage(box.read('language'));
    }
  }

  void changeLanguage(String languageCode) {
    selectedLanguage(languageCode);
    box.write('language', languageCode);
    Get.updateLocale(
        Locale(languageCode.split('_')[0], languageCode.split('_')[1]));
    Get.back();
  }

  void logOut() {
    Get.defaultDialog(
      title: 'Log Out',
      middleText: 'Are you sure you want to log out?',
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.red,
      confirm: CustomButton(
          textButton: 'Yes',
          color: Colors.red,
          onPressed: () {
            _auth.signOut();
            Get.offAllNamed(AppRoutes.navigationPage);
          }),
      cancel: CustomButton(
        textButton: 'Cancel',
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
