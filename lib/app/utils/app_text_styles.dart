import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900, // Black
    fontFamily: "Erbaum",
    color: AppColors.textPrimary,
  );

  static const subHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: "Erbaum",
    color: AppColors.textSecondary,
  );

  static const body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: "Erbaum",
    color: AppColors.textPrimary,
  );

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontFamily: "Erbaum",
    color: AppColors.textWhite,
  );
}
