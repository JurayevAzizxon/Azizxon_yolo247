import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Cricket Theme
  static const Color primary = Color(0xFF1E3A8A); // Cricket Blue
  static const Color primaryLight = Color(0xFF3B82F6); // Light Blue
  static const Color primaryDark = Color(0xFF1E40AF); // Dark Blue

  // Secondary Colors - Gold/Yellow for Cricket
  static const Color secondary = Color(0xFFFFA726); // Cricket Gold
  static const Color secondaryLight = Color(0xFFFFCC02); // Light Gold
  static const Color secondaryDark = Color(0xFFF57F17); // Dark Gold

  // Accent Colors
  static const Color accent = Color(0xFF10B981); // Success Green
  static const Color accentDark = Color(0xFF059669); // Dark Green

  // Cricket Field Colors
  static const Color fieldGreen = Color(0xFF22C55E); // Cricket Field Green
  static const Color fieldLight = Color(0xFF4ADE80); // Light Field Green
  static const Color fieldDark = Color(0xFF16A34A); // Dark Field Green

  // Text Colors - Light Theme
  static const Color textPrimary = Color(0xFF111827); // Dark Gray
  static const Color textSecondary = Color(0xFF6B7280); // Medium Gray
  static const Color textLight = Color(0xFF9CA3AF); // Light Gray
  static const Color textWhite = Color(0xFFFFFFFF); // White

  // Background Colors - Light Theme
  static const Color background = Color(0xFFF9FAFB); // Light Background
  static const Color surface = Color(0xFFFFFFFF); // White Surface
  static const Color surfaceDark = Color(0xFFF3F4F6); // Dark Surface

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF0A0E27); // Dark Background
  static const Color darkSurface = Color(0xFF1A1F3A); // Dark Surface
  static const Color darkSurfaceLight = Color(0xFF2A3050); // Dark Surface Light
  static const Color darkTextPrimary = Color(0xFFF9FAFB); // Light Text
  static const Color darkTextSecondary = Color(0xFFD1D5DB); // Medium Light Text
  static const Color darkTextLight = Color(0xFF9CA3AF); // Light Gray Text

  // Status Colors
  static const Color success = Color(0xFF10B981); // Green
  static const Color warning = Color(0xFFF59E0B); // Orange
  static const Color error = Color(0xFFEF4444); // Red
  static const Color info = Color(0xFF3B82F6); // Blue

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFE5E7EB);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFFD1D5DB);
  static const Color darkBorder = Color(0xFF374151);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color darkShadow = Color(0x33000000);
  static const Color shadowDark = Color(0x33000000);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient fieldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [fieldLight, fieldGreen],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryLight, secondary],
  );

  static const LinearGradient welcomeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6272DB), Color(0xFF3B4AA2)],
  );

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A0E27), Color(0xFF1A1F3A)],
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A1F3A), Color(0xFF2A3050)],
  );
   static const RadialGradient screenGradient = RadialGradient(
    center: Alignment(-0.6, 1.35),
    radius: 1.2,
    colors: [Color(0xFF242E38), Color(0xFF080209)],
    stops: [0.0, 0.633],
  );
}
