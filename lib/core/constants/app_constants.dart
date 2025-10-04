import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  // Screen Dimensions
  static double get screenWidth => ScreenUtil().screenWidth;
  static double get screenHeight => ScreenUtil().screenHeight;

  // Padding Values
  static EdgeInsets get defaultPadding => EdgeInsets.all(16.w);
  static EdgeInsets get smallPadding => EdgeInsets.all(8.w);
  static EdgeInsets get largePadding => EdgeInsets.all(24.w);
  static EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: 16.h);

  // Border Radius
  static BorderRadius get defaultBorderRadius => BorderRadius.circular(12.r);
  static BorderRadius get smallBorderRadius => BorderRadius.circular(8.r);
  static BorderRadius get largeBorderRadius => BorderRadius.circular(16.r);
  static BorderRadius get circularBorderRadius => BorderRadius.circular(50.r);

  // Spacing
  static double get smallSpacing => 8.h;
  static double get mediumSpacing => 16.h;
  static double get largeSpacing => 24.h;
  static double get extraLargeSpacing => 32.h;

  // Button Dimensions
  static Size get defaultButtonSize => Size(double.infinity, 48.h);
  static Size get smallButtonSize => Size(120.w, 40.h);
  static Size get largeButtonSize => Size(double.infinity, 56.h);

  // Icon Sizes
  static double get smallIconSize => 16.w;
  static double get mediumIconSize => 24.w;
  static double get largeIconSize => 32.w;
  static double get extraLargeIconSize => 48.w;

  // Animation Durations
  static Duration get shortAnimation => const Duration(milliseconds: 200);
  static Duration get mediumAnimation => const Duration(milliseconds: 300);
  static Duration get longAnimation => const Duration(milliseconds: 500);

  // Cricket Specific Constants
  static const int maxOvers = 50;
  static const int maxWickets = 10;
  static const int maxRunsPerBall = 6;
  static const int minOvers = 1;
}
