//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controller/user_details_controller.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left_2),
              onPressed: () {
                Get.back();
              },
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Jenifer'),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  fit: BoxFit.cover,
                  'https://r4.wallpaperflare.com/wallpaper/725/670/339/women-mariya-volokh-face-portrait-wallpaper-f71cc0edea758d12168d5f1737e73981.jpg',
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                height: 1400,
                child: const Column(
                  children: [
                    Text('Jenifer', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
