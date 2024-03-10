//
// @Author: "Eldor Turgunov"
// @Date: 09.03.2024
//

import 'package:flutter/material.dart';

import '../theme/theme_helper.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color color;
  final double height;
  final double width;

  const CustomButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.color = const Color(0xFF0EBE7E),
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: ThemeHelper().lightTheme.textTheme.bodyMedium?.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
