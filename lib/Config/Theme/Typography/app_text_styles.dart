import 'package:flutter/material.dart';
import '/Config/Theme/Colors/app_colors.dart';

/// Typography styles (SRP: defines text styles only)
class AppTextStyles {
  AppTextStyles._();
  static const String roboto = 'Roboto';
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: roboto,
    color: AppColors.textPrimary,
  );

  static const TextStyle categoriesTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: roboto,
    color: AppColors.textPrimary,
  );

  static const TextStyle headLineTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: roboto,
    color: AppColors.textPrimary,
  );

  static const TextStyle textFieldBlackTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: roboto,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 15,
    fontFamily: roboto,
    color: AppColors.textSecondary,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontFamily: roboto,
    color: Colors.white,
  );
}
