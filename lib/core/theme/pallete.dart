import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoute_app/common/colors.dart';

class CustomAppTheme {
  ThemeData _customLightTheme() {
    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
        primaryColor: AppColors.mainAppColor,
        textTheme: GoogleFonts.lancelotTextTheme());
  }

  ThemeData get customLightTheme => _customLightTheme();
}
