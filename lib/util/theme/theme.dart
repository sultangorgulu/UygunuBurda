import 'package:flutter/material.dart';
import 'package:uygunuburda/util/theme/custom_themes/text_theme.dart';
import 'package:uygunuburda/util/theme/custom_themes/elevated_button_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/outlined_button_theme.dart';




class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  textTheme: AppTextTheme.lightTextTheme,
  elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  chipTheme: AppChipTheme.lightChipTheme,
  appBarTheme: AppAppBarTheme.lightAppBardTheme,
  checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
  bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
  outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
  inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
  );


  static ThemeData darkTheme =  ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.black,
  textTheme: AppTextTheme.darkTextTheme,
  elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  chipTheme: AppChipTheme.darkChipTheme,
  appBarTheme: AppAppBarTheme.darkAppBarTheme,
  checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
  bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
  outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
  inputDecorationTheme:AppTextFormFieldTheme.darkInputDecorationTheme,
  
  );

}