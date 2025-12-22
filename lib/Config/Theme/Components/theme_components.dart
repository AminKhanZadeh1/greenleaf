import 'package:flutter/material.dart';
import '../Colors/app_colors.dart';
import '../typography/app_text_styles.dart';

/// Custom button style, input decoration, etc.
class ThemeComponents {
  ThemeComponents._();

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.success,
    textStyle: AppTextStyles.buttonTextStyle,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  );

  static InputDecoration inputDecoration(String label) => InputDecoration(
    labelText: label,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.containerBorder, width: 2),
    ),
  );
}
