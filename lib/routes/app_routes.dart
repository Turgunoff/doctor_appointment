//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:doctor/presentation/auth/sign_up_screen/sign_up_screen.dart';
import 'package:get/get.dart';

import '../presentation/auth/log_in_screen/log_in_screen.dart';
import '../presentation/doctor_details_screen/doctor_details_screen.dart';
import '../presentation/home/bindings/home_binding.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/navigation/navigation_bindings/navigation_binding.dart';
import '../presentation/search_doctors/search_doctors_screen.dart';
import '../presentation/splash_screen/binding/splash_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/inbox_screen/inbox_screen.dart';
import '../presentation/location_screen/location_screen.dart';
import '../presentation/my_booking_screen/my_booking_screen.dart';
import '../presentation/navigation/navigation_page.dart';
import '../presentation/profile/profile_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String myBookingScreen = '/myBookingScreen';
  static const String inboxScreen = '/inboxScreen';
  static const String profileScreen = '/profileScreen';
  static const String logInScreen = '/logInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String exploreScreen = '/exploreScreen';
  static const String navigationPage = '/navigationPage';
  static const String initialRoute = '/splashScreen';
  static const String doctorDetailsScreen = '/userDetailsScreen';
  static const String searchDoctorsScreen = '/searchDoctors';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: navigationPage,
      page: () => NavigationPage(),
      bindings: [NavigationBinding()],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(name: exploreScreen, page: () => LocationScreen()),
    GetPage(name: myBookingScreen, page: () => MyBookingScreen()),
    GetPage(name: inboxScreen, page: () => InboxScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: logInScreen, page: () => LogInScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: doctorDetailsScreen, page: () => DoctorDetailsScreen()),
    GetPage(name: searchDoctorsScreen, page: () => SearchDoctorsScreen()),
  ];
}
