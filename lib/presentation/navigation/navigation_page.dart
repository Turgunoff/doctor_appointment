//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../explore_screen/explore_screen.dart';
import '../home/home_screen.dart';
import '../inbox_screen/inbox_screen.dart';
import '../profile/profile_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // page controller instance
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                HomeScreen(),
                ExploreScreen(),
                InboxScreen(),
                ProfileScreen(),
              ],
            ),
          ),
        ],
      ),
      // bottomnavigationbar that call the
      // SlidingClippedNavBar widget
      bottomNavigationBar: SlidingClippedNavBar(

        backgroundColor: Colors.white,
        // change the page of the
        // body by click on tab
        onButtonPressed: changePage,
        // size of the icons of the tab
        iconSize: 24,
        fontWeight: FontWeight.w400,
        activeColor: Theme.of(context).primaryColor,
        // color of tab otherthan
        // of selected tab
        inactiveColor: Colors.black54,
        // selected tab that point
        // the index of the tab
        selectedIndex: selectedIndex,
        // items of the navigation bar
        barItems: <BarItem>[
          BarItem(
            icon: Iconsax.home,
            title: 'Home',
          ),
          BarItem(
            icon: Iconsax.location,
            title: 'Location',
          ),
          BarItem(
            icon: Iconsax.message,
            title: 'Inbox',
          ),
          BarItem(
            icon: Iconsax.profile_circle,
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}

// class NavigationPage extends StatelessWidget {
//   const NavigationPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NavigationController>(
//       builder: (controller) {
//         return Scaffold(
//           body: SafeArea(
//             child: IndexedStack(
//               index: controller.tabIndex,
//               children: const [
//                 HomeScreen(),
//                 ExploreScreen(),
//                 MyBookingScreen(),
//                 InboxScreen(),
//                 ProfileScreen(),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             unselectedItemColor: const Color(0xff9E9E9E),
//             selectedItemColor: Theme.of(context).primaryColor,
//             onTap: controller.changeTabIndex,
//             currentIndex: controller.tabIndex,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             type: BottomNavigationBarType.fixed,
//             items: [
//               _bottomNavigationBarItem(
//                 icon: Iconsax.home,
//                 label: 'lbl_home'.tr,
//               ),
//               _bottomNavigationBarItem(
//                 icon: Iconsax.location,
//                 label: 'lbl_explore'.tr,
//               ),
//               _bottomNavigationBarItem(
//                 icon: Iconsax.calendar,
//                 label: 'lbl_my_booking'.tr,
//               ),
//               _bottomNavigationBarItem(
//                 icon: Iconsax.message,
//                 label: 'lbl_inbox'.tr,
//               ),
//               _bottomNavigationBarItem(
//                 icon: Iconsax.profile_circle,
//                 label: 'lbl_profile'.tr,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   _bottomNavigationBarItem({
//     required IconData icon,
//     required String label,
//   }) {
//     return BottomNavigationBarItem(
//       icon: Icon(icon),
//       label: label,
//     );
//   }
// }
