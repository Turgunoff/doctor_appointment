import 'dart:ui';

import 'package:doctor/presentation/profile/profile_client_screen.dart';
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
          if (controller.userType?.value?.userType == 'client') {
            return ProfileClientScreen(); // Create this Scaffold
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.white.withAlpha(100),
                    ),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.white.withAlpha(100),
                title: const Text('Profile Doctor'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.edit),
                  ),
                ],
              ),
              body: Container(
                height: 220,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade400),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                controller.userType?.value?.userType ?? ''),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userType?.value?.userType ?? '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              //need to verificate user
                              //phone number
                              Text(
                                '+99894',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    // balance and rating of doctor
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Balance',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '130 000.00',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'User need to be verificated',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
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
