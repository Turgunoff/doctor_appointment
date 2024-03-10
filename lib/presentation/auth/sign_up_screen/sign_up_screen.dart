//
// @Author: "Eldor Turgunov"
// @Date: 09.03.2024
//

import 'package:doctor/theme/theme_helper.dart';
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
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<SignUpController>(builder: (ctx) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Client');
                      signUpController.selectUserType(
                        UserType.client,
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: signUpController.userType == UserType.client
                            ? Theme.of(context).primaryColor.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: signUpController.userType == UserType.client
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I am a client, looking for a doctor',
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Doctor');
                      signUpController.selectUserType(
                        UserType.doctor,
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: signUpController.userType == UserType.doctor
                            ? Theme.of(context).primaryColor.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: signUpController.userType == UserType.doctor
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I am a doctor, looking for work',
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                textButton: 'Sign Up',
                onPressed: () {
                  Get.to(
                    () => SignUpNext(),
                    transition: Transition.rightToLeft,
                  );
                },
                width: _size.width * 0.8,
                height: 50,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class SignUpNext extends StatelessWidget {
  SignUpNext({super.key});

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
              Text(
                'Sign Up as a ${signUpController.userType == UserType.client ? 'Client' : 'Doctor'}',
                style:  TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
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
                  signUpController.signUp();
                },
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
