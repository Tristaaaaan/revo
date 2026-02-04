// lib/core/design_tokens.dart
import 'package:flutter/material.dart';

/// -----------------------------
/// COLORS
/// -----------------------------
class AppColors {
  static const primary = Color(0xFF6200EE);
  static const secondary = Color(0xFF03DAC6);
  static const background = Color(0xFFF5F5F5);
  static const error = Color(0xFFB00020);
  static const white = Colors.white;
  static const black = Colors.black;
  static const gray = Color(0xFF9E9E9E);
}

/// -----------------------------
/// SPACING
/// -----------------------------
class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

/// -----------------------------
/// RADIUS / BORDER
/// -----------------------------
class AppRadius {
  static const sm = 10.0; // small
  static const sm2 = 14.0; // small-medium
  static const md = 16.0; // medium
  static const md2 = 20.0; // medium-large
}

/// -----------------------------
/// TEXT SIZES
/// -----------------------------
class AppTextSizes {
  static const xs = 12.0;
  static const sm = 14.0;
  static const md = 16.0;
  static const lg = 20.0;
  static const xl = 24.0;
  static const xxl = 32.0;
}

/// -----------------------------
/// FONT WEIGHTS
/// -----------------------------
class AppFontWeights {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
}

/// -----------------------------
/// TEXT STYLES
/// -----------------------------
class AppTextStyles {
  static const heading1 = TextStyle(
    fontSize: AppTextSizes.xxl,
    fontWeight: AppFontWeights.bold,
    color: AppColors.black,
  );

  static const heading2 = TextStyle(
    fontSize: AppTextSizes.xl,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.black,
  );

  static const heading3 = TextStyle(
    fontSize: AppTextSizes.lg,
    fontWeight: AppFontWeights.medium,
    color: AppColors.black,
  );

  static const body = TextStyle(
    fontSize: AppTextSizes.md,
    fontWeight: AppFontWeights.regular,
    color: AppColors.black,
  );

  static const bodySmall = TextStyle(
    fontSize: AppTextSizes.sm,
    fontWeight: AppFontWeights.regular,
    color: AppColors.gray,
  );

  static const button = TextStyle(
    fontSize: AppTextSizes.md,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.white,
  );
}
