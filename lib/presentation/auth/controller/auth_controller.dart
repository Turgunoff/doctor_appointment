//
// @Author: "Eldor Turgunov"
// @Date: 18.02.2024
//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    // Listen for auth state changes
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // If user is signed in, navigate to home screen
        Get.offAndToNamed(AppRoutes.navigationPage); // Use Get.offAll to navigate without back button
      } else {
        // If user is signed out, navigate to sign-in screen
        Get.offAndToNamed(AppRoutes.signInScreen); // Use Get.offAll to navigate without back button
      }
    });
  }

  void onSignOut() async {
    await _auth.signOut();
    Get.offAllNamed(AppRoutes.signInScreen);
  }
}