//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../explore_screen/explore_screen.dart';
import '../home/home_screen.dart';
import '../inbox_screen/inbox_screen.dart';
import '../my_booking_screen/my_booking_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'controller/navigation_controller.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              const HomeScreen(),
              const ExploreScreen(),
              const MyBookingScreen(),
              const InboxScreen(),
              ProfileScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: const Color(0xff9E9E9E),
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            _bottomNavigationBarItem(
              icon: CupertinoIcons.home,
              label: 'lbl_home'.tr,
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.location_solid,
              label: 'lbl_explore'.tr,
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.calendar_today,
              label: 'lbl_my_booking'.tr,
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.chat_bubble_fill,
              label: 'lbl_inbox'.tr,
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.person,
              label: 'lbl_profile'.tr,
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
