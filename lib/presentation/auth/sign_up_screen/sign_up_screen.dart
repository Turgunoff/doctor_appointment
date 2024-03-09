//
// @Author: "Eldor Turgunov"
// @Date: 09.03.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes/app_routes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Email',
                prefixIcon: Iconsax.message,
                controller: signUpController.emailController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Password',
                prefixIcon: Iconsax.lock,
                controller: signUpController.passwordController,
              ),
              const SizedBox(height: 10),
              CustomButton(
                textButton: 'Sign Up',
                onPressed: () {
                  Get.toNamed(AppRoutes.homeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
