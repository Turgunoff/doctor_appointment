//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:get/get.dart';

import '../presentation/auth/sign_in_screen/sign_in_screen.dart';
import '../presentation/home/bindings/home_binding.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/navigation/navigation_bindings/navigation_binding.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/inbox_screen/inbox_screen.dart';
import '../presentation/explore_screen/explore_screen.dart';
import '../presentation/my_booking_screen/my_booking_screen.dart';
import '../presentation/navigation/navigation_page.dart';
import '../presentation/profile_screen/profile_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String navigationPage = '/navigationPage';
  static const String homeScreen = '/home_screen';
  static const String exploreScreen = '/exploreScreen';
  static const String myBookingScreen = '/myBookingScreen';
  static const String inboxScreen = '/inboxScreen';
  static const String profileScreen = '/profileScreen';
  static const String initialRoute = '/initialRoute';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: navigationPage,
      page: () => const NavigationPage(),
      bindings: [
        NavigationBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: exploreScreen,
      page: () => const ExploreScreen(),
    ),
    GetPage(
      name: myBookingScreen,
      page: () => const MyBookingScreen(),
    ),
    GetPage(
      name: inboxScreen,
      page: () => const InboxScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
    ),
  ];
}
