import 'package:doctor/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/auth/views/login_screen.dart';
import 'features/auth/views/user_register_screen.dart';
import 'features/home/views/home_screen.dart';
import 'features/main_screen/main_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/splash/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment BLoC',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF374151),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 16),
          bodyLarge: TextStyle(fontSize: 26),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenWrapper(),
        '/home': (context) => const HomeScreenWrapper(),
        '/login': (context) => const LoginScreenWrapper(),
        '/userRegister': (context) => const RegisterScreenWrapper(),
        '/mainScreen': (context) => const MainScreen(),
        '/profileScreen': (context) => const ProfileScreenWrapper(),
      },
    );
  }
}
