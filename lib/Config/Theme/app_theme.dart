import 'package:flutter/material.dart';
import 'Colors/app_colors.dart';
import 'typography/app_text_styles.dart';
import 'components/theme_components.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Vazir',
    scaffoldBackgroundColor: AppColors.scaffold,
    primaryColor: AppColors.magmaRed,
    colorScheme: ColorScheme.light(
      primary: AppColors.amberOrange,
      secondary: AppColors.magmaRed,
      error: AppColors.error,
    ),
    textTheme: const TextTheme(
      headlineMedium: AppTextStyles.headLineTextStyle,
      bodyMedium: AppTextStyles.bodyTextStyle,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.amberOrange,
      elevation: 3,
      enableFeedback: true,
      selectedItemColor: AppColors.magmaRed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ThemeComponents.primaryButton,
    ),
  );
}
