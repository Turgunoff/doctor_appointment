//
// @Author: "Eldor Turgunov"
// @Date: 17.02.2024
//

import 'dart:async';

import 'package:doctor/generated/assets.dart';
import 'package:doctor/presentation/auth/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../main.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import 'controller/log_in_controller.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;
  final logInController = Get.put(LogInController());

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        Get.offAllNamed(AppRoutes.navigationPage);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  Future<void> _logIn() async {
    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      try {
        await supabase.auth.signInWithPassword(
          password: _passwordController.text,
          email: _emailController.text,
        );

        // Успешный вход
        Get.offAllNamed(AppRoutes.navigationPage);
        Get.snackbar(
          'Успешно!',
          'Вы успешно вошли в систему',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.shade400,
          colorText: Colors.white,
        );
      } on AuthException catch (error) {
        handleLoginError(error);
      } on Exception catch (_) {
        Get.snackbar(
          'Ошибка',
          'Произошла непредвиденная ошибка',
          backgroundColor: Theme.of(context).colorScheme.error,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      }
    } else {
      Get.snackbar(
        'Ошибка',
        'Все поля должны быть заполнены',
        backgroundColor: Theme.of(context).colorScheme.error,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void handleLoginError(AuthException error) {
    String errorMessage;

    switch (error.message) {
      case "Invalid credentials": // Supabase-specific message
        errorMessage = "Неверный email или пароль";
        break;
      case "Invalid login credentials":
        errorMessage = "Неверный email или пароль";
        break;
      // Add other cases if needed...
      default:
        errorMessage = "Ошибка входа: ${error.message}";
    }

    Get.snackbar(
      'Ошибка',
      errorMessage,
      backgroundColor: Theme.of(context).colorScheme.error,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    //width and height of the screen
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            'assets/images/back.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left_2),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Text(
                    'Hi, Welcome Back!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hope youre doing fine',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: 'Email',
                      prefixIcon:
                          Icon(Icons.mail_outline, color: Colors.grey.shade600),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      labelStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.key, color: Colors.grey.shade600),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      labelStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    height: 50,
                    width: double.infinity,
                    textButton: 'Log In',
                    onPressed: () {
                      _logIn();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(height: 15, color: Colors.grey.shade400),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('or'),
                      ),
                      Expanded(
                        child: Divider(height: 15, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.svgGoogle,
                                height: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              const Text('Google'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.svgFacebook,
                                height: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Facebook'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SignUpScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                        ),
                      ),
                    ],
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
