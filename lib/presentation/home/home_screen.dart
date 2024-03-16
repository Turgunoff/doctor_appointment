import 'dart:ui';

import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title: const Text('controller.greeting.value'),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
            SizedBox(
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
            //catergories of doctors
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffF4F5F9),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/frame.png',
                                  height: 50, width: 50, fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                      const Text(
                        maxLines: 1,
                        'Derma',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            //popular doctors
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Doctors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<HomeController>(builder: (ctx) {
              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 16, right: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.popularDoctors.length,
                itemBuilder: (context, index) {
                  final doctors = controller.popularDoctors[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6,
                              spreadRadius: 0,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                  'https://cdn.dribbble.com/users/383572/screenshots/10827423/health_app_real_pixels_4x.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      doctors.userName ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      'category',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.yellow,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.yellow,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Row(
                                      children: [
                                        Icon(Iconsax.location,
                                            color: Colors.grey, size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          '2.5 km',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.favorite_border,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),

            const SizedBox(height: 20),
            //nearby doctors
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nearby',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            //nearby doctors
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, right: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          spreadRadius: 0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                              'https://cdn.dribbble.com/users/383572/screenshots/10827423/health_app_real_pixels_4x.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  'Dr. Eldor',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'category',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.yellow,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 16),
                                        SizedBox(width: 4),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Row(
                                  children: [
                                    Icon(Iconsax.location,
                                        color: Colors.grey, size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      '2.5 km',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite_border, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
