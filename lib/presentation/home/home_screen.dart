import 'dart:ui';

import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
        title: Obx(() => Text(controller.greeting.value)),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Iconsax.search_normal_1),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Iconsax.notification),
                    onPressed: () {
                      Get.toNamed(AppRoutes.userDetailsScreen);
                    },
                  ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 10,
                        minHeight: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.users.isEmpty) {
          return const Center(child: Text('No users found'));
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                //search doctors and hospitals
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       contentPadding: const EdgeInsets.all(12),
                //       hintText: 'Search doctors',
                //       prefixIcon: const Icon(Iconsax.search_normal_1),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(6),
                //         borderSide:
                //             const BorderSide(color: Colors.grey, width: 2),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(6),
                //         borderSide: BorderSide(
                //             color: Theme.of(context).primaryColor, width: 2),
                //       ),
                //       prefixIconColor: Colors.grey[600],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 16),
                //beautiful carousel slider for hospitals and news with pageview
                Container(
                  height: 150,
                  child: PageView.builder(
                    itemCount: 5,
                    pageSnapping: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://i.pinimg.com/originals/46/5a/f1/465af15f6684b1ea0d799fda31c951e3.jpg',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        backgroundImage: user.photoURL != null
                            ? NetworkImage(user.photoURL!, scale: 1.0)
                            : AssetImage(
                                user.userSex == 'male'
                                    ? 'assets/images/person_avatar_icon.png'
                                    : 'assets/images/women_avatar_icon.png',
                              ) as ImageProvider,
                      ),
                      title: Text(user.uid),
                      // subtitle: Text('User rating: ${user.totalRating}'.toString() ?? '0'),
                    );
                  },
                ),
                Container(
                  height: 1000,
                  color: Colors.grey[600],
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
