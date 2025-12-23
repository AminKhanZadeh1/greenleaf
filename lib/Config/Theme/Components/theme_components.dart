import 'package:flutter/material.dart';
import '../Colors/app_colors.dart';
import '../typography/app_text_styles.dart';

class ThemeComponents {
  ThemeComponents._();

  static ButtonStyle productCounterButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.success,
    textStyle: AppTextStyles.buttonTextStyle,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  );
}
