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
        title: const Text('Profile Client'),
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
            Text('Client: '),
          ],
        ),
      ),
    );
  }
}
