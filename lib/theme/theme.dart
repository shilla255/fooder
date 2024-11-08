import 'package:flutter/material.dart';
import 'app_color.dart';
import 'theme_constants.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: const ColorScheme.light(
    secondary: AppColors.accentColor,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColorLight,
  textTheme: const TextTheme(
    titleLarge: AppTextStyles.headline1,
    bodyMedium: AppTextStyles.bodyText1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(buttonWidth, buttonHeight),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    constraints: BoxConstraints(
      maxWidth: textFieldWidth,
      maxHeight: textFieldHeight,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primaryColorDark,
  colorScheme: const ColorScheme.dark(
    secondary: AppColors.accentColor,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColorDark,
  textTheme: TextTheme(
    titleLarge: AppTextStyles.headline1.copyWith(color: Colors.white),
    bodyMedium: AppTextStyles.bodyText1.copyWith(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(buttonWidth, buttonHeight),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    constraints: BoxConstraints(
      maxWidth: textFieldWidth,
      maxHeight: textFieldHeight,
    ),
  ),
);