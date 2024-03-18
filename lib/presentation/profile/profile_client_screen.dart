//
// @Author: "Eldor Turgunov"
// @Date: 16.03.2024
//

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controller/profile_controller.dart';

class ProfileClientScreen extends StatelessWidget {
  ProfileClientScreen({Key? key}) : super(key: key);

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
        Scaffold(
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
            title: Text('Profile Client'),
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
                      '',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Eldor Turgunov',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                    leading: const Icon(Iconsax.logout, color: Colors.red),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
