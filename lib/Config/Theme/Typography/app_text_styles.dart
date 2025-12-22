import 'package:flutter/material.dart';
import '/Config/Theme/Colors/app_colors.dart';

/// Typography styles (SRP: defines text styles only)
class AppTextStyles {
  AppTextStyles._();
  static const String vazir = 'Vazir';
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: vazir,
    color: AppColors.textPrimary,
  );

  static const TextStyle categoriesTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: vazir,
    color: AppColors.textPrimary,
  );

  static const TextStyle headLineTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: vazir,
    color: AppColors.textPrimary,
  );

  static const TextStyle textFieldBlackTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: vazir,
    color: AppColors.textPrimary,
  );

  static const textFieldWhiteTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: vazir,
    color: AppColors.background,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 15,
    fontFamily: vazir,
    color: AppColors.textSecondary,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontFamily: vazir,
    color: Colors.white,
  );
}

class DesktopAppTextStyles {
  DesktopAppTextStyles._();

  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle headLineTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle textFieldBlackTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const textFieldWhiteTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: AppColors.background,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyBlackTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.textPrimary,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
}
