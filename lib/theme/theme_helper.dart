//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'package:flutter/material.dart';

const primaryColor = Color(0xFF6200EE);

class ThemeHelper {
  final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    textTheme: _textTheme,
    scaffoldBackgroundColor: const Color(0xFF121212),
    dividerTheme: DividerThemeData(
      color: Colors.grey.withOpacity(0.1),
      space: 0,
      thickness: 1,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
  );

  final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    textTheme: _textTheme,
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    dividerTheme: DividerThemeData(
      color: Colors.grey.withOpacity(0.1),
      space: 0,
      thickness: 1,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
  );
}

const _textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
  headlineLarge: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headlineSmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  ),
  bodyLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  ),
  labelMedium: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.75,
  ),
  labelSmall: TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  ),
);
