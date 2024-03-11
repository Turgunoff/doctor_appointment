import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/custom_button.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (ctx) {
        if (controller.user != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              actions: [
                IconButton(
                  onPressed: () {
                    controller.logOut();
                  },
                  icon: const Icon(Iconsax.logout),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email: ${controller.user!.email}'),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CustomButton(
                  textButton: 'Kirish/Ro\'yxatdan o\'tish',
                  onPressed: () {
                    Get.toNamed(AppRoutes.logInScreen);
                  },
                  height: 50,
                  width: double.infinity,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
