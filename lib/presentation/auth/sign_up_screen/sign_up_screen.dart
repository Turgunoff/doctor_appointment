//
// @Author: "Eldor Turgunov"
// @Date: 09.03.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            'assets/images/back.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left_2),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/images/back.png',
                  fit: BoxFit.cover,
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.white.withOpacity(0.0),
                  leading: IconButton(
                    icon: const Icon(Iconsax.arrow_left_2),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Text(
                        'Sign Up as Client',
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge?.fontSize,
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
                          signUpController.signUp(
                            signUpController.emailController.text,
                            signUpController.passwordController.text,
                          );
                        },
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
