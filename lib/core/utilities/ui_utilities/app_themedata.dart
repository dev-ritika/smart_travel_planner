import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integrated_todo/core/app_consts/color_consts.dart';

class AppThemedata {
  static ThemeData getAppThemeData() {
    return ThemeData(
      textTheme: GoogleFonts.lexendDecaTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConsts.secondaryColor,
          foregroundColor: ColorConsts.primaryColor,
        ),
      ),

      primaryColor: ColorConsts.primaryColor,
      secondaryHeaderColor: ColorConsts.secondaryColor,

      inputDecorationTheme: InputDecorationThemeData(
        fillColor: ColorConsts.whiteColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: ColorConsts.primaryColor, width: 7),
        ),
        labelStyle: TextStyle(color: ColorConsts.primaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(color: Colors.grey),
        isDense: true, // reduces default height
        contentPadding: EdgeInsets.symmetric(
          vertical: 12, // controls height
          horizontal: 16,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConsts.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConsts.primaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),

        filled: true,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorConsts.primaryColor,
      ),

      primaryTextTheme: GoogleFonts.lexendDecaTextTheme(),
      useMaterial3: true,
      // colorScheme: ColorScheme.fromSeed(seedColor: ColorConsts.primaryColor),
    );
  }
}
