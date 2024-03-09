import 'package:doctor/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Get.snackbar(
              barBlur: 0.0,
              snackbarStatus: (status) {
                print('Snack status: $status');
              },
              forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
              snackStyle: SnackStyle.FLOATING,
              backgroundGradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark,
                ],
              ),
              'LogIn/SignUp',
              'This feature is not available yet',
              snackPosition: SnackPosition.TOP,
            );
          },
          child: Text(
            'LogIn/SignUp',
            style: TextStyle(
              color: Colors.white,
              fontSize: ThemeHelper().lightTheme.textTheme.bodyLarge?.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
