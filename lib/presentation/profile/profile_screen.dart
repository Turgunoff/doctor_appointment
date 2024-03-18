import 'dart:ui';

import 'package:doctor/presentation/profile/profile_client_screen.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
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
    //size height and width
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: const Image(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        GetBuilder<ProfileController>(
          builder: (ctx) {
            if (controller.user != null) {
              if (controller.userType?.value?.userType == 'client') {
                return ProfileClientScreen(); // Create this Scaffold
              } else {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    centerTitle: true,
                    flexibleSpace: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.white.withOpacity(0.0),
                        ),
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white.withOpacity(0.0),
                    title: const Text('Profile Doctor'),
                  ),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 100),
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              'https://avatars.mds.yandex.net/i?id=11c90c9d11476753572453cd0f8ed8306ad76cea-10555250-images-thumbs&n=13',
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Dr. Eldor Turgunov',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          //phone number
                          Text(
                            '+998 99 999 99 99',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 20),
                          //edit profile, favorite, settings, help, logout
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Iconsax.edit),
                            title: const Text('Edit Profile'),
                            trailing: const Icon(Iconsax.arrow_right_3),
                          ),
                          Divider(height: 1, color: Colors.grey.shade300),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Iconsax.heart),
                            title: const Text('Favorite'),
                            trailing: const Icon(Iconsax.arrow_right_3),
                          ),
                          Divider(height: 1, color: Colors.grey.shade300),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Iconsax.notification),
                            title: const Text('Notifications'),
                            trailing: const Icon(Iconsax.arrow_right_3),
                          ),
                          Divider(height: 1, color: Colors.grey.shade300),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Iconsax.settings),
                            title: const Text('Settings'),
                            trailing: const Icon(Iconsax.arrow_right_3),
                          ),
                          Divider(height: 1, color: Colors.grey.shade300),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Iconsax.support),
                            title: const Text('Help'),
                            trailing: const Icon(Iconsax.arrow_right_3),
                          ),
                          Divider(height: 1, color: Colors.grey.shade300),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Iconsax.security),
                            title: const Text('Terms and Conditions'),
                            trailing: const Icon(Iconsax.arrow_right_3),
                          ),
                          Divider(height: 1, color: Colors.grey.shade300),
                          ListTile(
                            onTap: () {
                              controller.logOut();
                            },
                            leading:
                                const Icon(Iconsax.logout, color: Colors.red),
                            title: const Text(
                              'Logout',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: const Image(
                      image: AssetImage('assets/images/back.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      centerTitle: true,
                      backgroundColor: Colors.white.withOpacity(0.0),
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
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
