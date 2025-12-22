import 'package:flutter/material.dart';
import 'Colors/app_colors.dart';
import 'typography/app_text_styles.dart';
import 'components/theme_components.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.scaffold,
    primaryColor: AppColors.charcoalBlack,
    colorScheme: ColorScheme.light(error: AppColors.error),
    textTheme: const TextTheme(
      headlineMedium: AppTextStyles.headLineTextStyle,
      bodyMedium: AppTextStyles.bodyTextStyle,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 3,
      enableFeedback: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ThemeComponents.primaryButton,
    ),
  );
}
