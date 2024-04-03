//
// @Author: "Eldor Turgunov"
// @Date: 09.03.2024
//

import 'package:doctor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../generated/assets.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final signUpController = Get.put(SignUpController());

  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() async {
    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _fullNameController.text.isNotEmpty) {
      try {
        final signUpResponse = await supabase.auth.signUp(
          password: _passwordController.text,
          email: _emailController.text,
        );

        if (signUpResponse.error == null) {
          final userId = signUpResponse.user!.id;

          await supabase.client.from('profiles').insert({
            'user_id': userId,
            'full_name': _fullNameController.text
          }).execute();

          Get.back(); // Close SignUpScreen
          Get.snackbar(
            'Success',
            'User created and profile saved',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green.shade400,
            colorText: Colors.white,
          );
        } else {
          handleSignUpError(signUpResponse.error!);
        }
      } on AuthException catch (error) {
        handleSignUpError(error);
      } catch (error) {
        Get.snackbar(
          'Error',
          'An unexpected error occurred: $error',
          backgroundColor: Theme.of(context).colorScheme.error,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'All fields must be filled',
        backgroundColor: Theme.of(context).colorScheme.error,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void handleSignUpError(AuthException error) {
    String errorMessage = "An unknown error occurred.";

    switch (error.message) {
      case "User already registered with this email":
        errorMessage = "This email address is already in use.";
        break;
      case "Password should be at least 6 characters":
        errorMessage = "Password is too weak.";
        break;
      // Add more cases for other error.message values...
      default:
        errorMessage = "Sign-up error: ${error.message}";
    }

    Get.snackbar(
      'Error',
      errorMessage,
      backgroundColor: Theme.of(context).colorScheme.error,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
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
                    height: size.height * 0.05,
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
                  SignUpTextFiled(
                      fullNameController: _fullNameController,
                      emailController: _emailController,
                      passwordController: _passwordController),
                  const SizedBox(height: 20),
                  CustomButton(
                    height: 50,
                    width: double.infinity,
                    textButton: 'Sign Up',
                    onPressed: () {
                      _signUp();
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
                  const GoogleOrFacebook(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SignUpTextFiled extends StatelessWidget {
  const SignUpTextFiled({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _fullNameController = fullNameController,
        _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _fullNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _fullNameController,
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
            labelText: 'Full Name',
            prefixIcon: Icon(Icons.person, color: Colors.grey.shade600),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
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
            prefixIcon: Icon(Icons.mail_outline, color: Colors.grey.shade600),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600),
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}

class GoogleOrFacebook extends StatelessWidget {
  const GoogleOrFacebook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                const SizedBox(
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
                const SizedBox(
                  width: 8,
                ),
                const Text('Facebook'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
