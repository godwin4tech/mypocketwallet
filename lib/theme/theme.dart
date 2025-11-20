import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.deepBlue,
      colorScheme: const ColorScheme.light(
        primary: AppColors.deepBlue,
        secondary: AppColors.orangeAccent,
      ),
      scaffoldBackgroundColor: AppColors.lightGray,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.deepBlue,
        elevation: 0,
      ),
    );
  }
}