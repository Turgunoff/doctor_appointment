//
// @Author: "Eldor Turgunov"
// @Date: 17.02.2024
//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class SignInController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void onSignIn()async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String signInResult = await signIn(email, password);
    if (signInResult == "Signed in successfully") {
      Get.offAndToNamed(AppRoutes.navigationPage);
    }

  }

  Future<String> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "Wrong password provided for that user";
      }
      return "Error: ${e.message}";
    } catch (e) {
      print(e.toString());
      return "Error: ${e.toString()}";
    }
  }
}