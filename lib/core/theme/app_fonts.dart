import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yolo247/core/theme/app_colors.dart';

class AppFonts {
  // Font Family
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'OpenSans';
  static const String interFont = 'Inter';
  static const String kaushanScriptFont = 'Kaushan Script';
  static const String afacadFont = 'Afacad';

  // Font Sizes
  static double fontSize8 = 8.sp;
  static double fontSize10 = 10.sp;
  static double fontSize12 = 12.sp;
  static double fontSize14 = 14.sp;
  static double fontSize16 = 16.sp;
  static double fontSize18 = 18.sp;
  static double fontSize20 = 20.sp;
  static double fontSize22 = 22.sp;
  static double fontSize24 = 24.sp;
  static double fontSize28 = 28.sp;
  static double fontSize32 = 32.sp;
  static double fontSize36 = 36.sp;
  static double fontSize40 = 40.sp;
  static double fontSize48 = 48.sp;
  static double fontSize56 = 56.sp;
  static double fontSize64 = 64.sp;

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  /// Bular o'chirishi kerak
  static TextStyle headline1 = TextStyle(
    fontSize: fontSize48,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: fontSize40,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: fontSize32,
    fontWeight: semiBold,
    fontFamily: primaryFont,
  );

  static TextStyle headline4 = TextStyle(
    fontSize: fontSize28,
    fontWeight: semiBold,
    fontFamily: primaryFont,
  );

  static TextStyle headline5 = TextStyle(
    fontSize: fontSize24,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static TextStyle headline6 = TextStyle(
    fontSize: fontSize20,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static TextStyle subtitle1 = TextStyle(
    fontSize: fontSize16,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static TextStyle bodyText1 = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: primaryFont,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: fontSize14,
    fontWeight: regular,
    fontFamily: primaryFont,
  );

  static TextStyle caption = TextStyle(
    fontSize: fontSize12,
    fontWeight: regular,
    fontFamily: primaryFont,
  );

  static TextStyle overline = TextStyle(
    fontSize: fontSize10,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static TextStyle button = TextStyle(
    fontSize: fontSize16,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static TextStyle size20weight500fontInter = TextStyle(
    fontSize: 20,
    fontWeight: medium,
    fontFamily: interFont,
  );

  static TextStyle size42weight300fontKaushanScript = TextStyle(
    fontSize: 42,
    fontWeight: regular,
    fontFamily: kaushanScriptFont,
  );

  static TextStyle size42weight600fontAfacad = TextStyle(
    fontSize: 42,
    fontWeight: semiBold,
    fontFamily: afacadFont,
  );

  /// Mana shu qismgacha o'chirish kerak

  //// Google Fonts
  static TextStyle inter = GoogleFonts.inter();
  static TextStyle kaushanScript = GoogleFonts.kaushanScript();
  static TextStyle afacad = GoogleFonts.afacad();

  static TextStyle bold12Inter = GoogleFonts.inter(
    fontSize: fontSize12,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold14Inter = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold16Inter = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold18Inter = GoogleFonts.inter(
    fontSize: fontSize18,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold20Inter = GoogleFonts.inter(
    fontSize: fontSize20,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold22Inter = GoogleFonts.inter(
    fontSize: fontSize22,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold24Inter = GoogleFonts.inter(
    fontSize: fontSize24,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold28Inter = GoogleFonts.inter(
    fontSize: fontSize28,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold32Inter = GoogleFonts.inter(
    fontSize: fontSize32,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold36Inter = GoogleFonts.inter(
    fontSize: fontSize36,
    fontWeight: bold,
    color: AppColors.textWhite,
  );
}
