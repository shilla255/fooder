import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF6200EE); // Modern vibrant purple
  static const Color primaryColorDark = Color(0xFF3700B3); // Darker shade of primary color
  static const Color accentColor = Color(0xFF03DAC6); // Modern teal accent
  static const Color backgroundColorLight = Color(0xFFF5F5F5); // Light grey background for light theme
  static const Color backgroundColorDark = Color(0xFF121212); // Dark background for dark theme
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static const TextStyle bodyText1 = TextStyle(fontSize: 16, color: Colors.black87);
}