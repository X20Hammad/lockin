// Central color definitions for both light and dark themes.

import 'package:flutter/material.dart';

/// Central repository of palette colors used to construct application themes.
abstract final class AppColors {
  /// Focused, disciplined indigo seed color representing determination.
  static const Color primarySeed = Color(0xFF5B4BDB);

  // Light Mode Palette
  static const Color lightPrimary = Color(0xFF5B4BDB);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFE4E1FF);
  static const Color lightOnPrimaryContainer = Color(0xFF170065);

  static const Color lightBackground = Color(0xFFF7F8FA);
  static const Color lightOnBackground = Color(0xFF15151B);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF15151B);
  static const Color lightSurfaceContainer = Color(0xFFEFF1F5);
  static const Color lightSurfaceContainerHigh = Color(0xFFE6E9EF);
  static const Color lightOnSurfaceVariant = Color(0xFF5B5D6E);
  static const Color lightOutline = Color(0xFFD3D6E2);
  static const Color lightOutlineVariant = Color(0xFFE3E5EE);

  // Dark Mode Palette
  static const Color darkPrimary = Color(0xFF8E81FF);
  static const Color darkOnPrimary = Color(0xFF190069);
  static const Color darkPrimaryContainer = Color(0xFF4332C3);
  static const Color darkOnPrimaryContainer = Color(0xFFE4E1FF);

  static const Color darkBackground = Color(0xFF0F0F14);
  static const Color darkOnBackground = Color(0xFFEDEDF2);
  static const Color darkSurface = Color(0xFF171720);
  static const Color darkOnSurface = Color(0xFFEDEDF2);
  static const Color darkSurfaceContainer = Color(0xFF20202C);
  static const Color darkSurfaceContainerHigh = Color(0xFF292938);
  static const Color darkOnSurfaceVariant = Color(0xFFA1A3B5);
  static const Color darkOutline = Color(0xFF3B3B4E);
  static const Color darkOutlineVariant = Color(0xFF2D2D3D);
}
