import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
 AppTextFormFieldTheme._();


 static InputDecorationTheme lightInputDecorationTheme =  InputDecorationTheme(
errorMaxLines: 3,
prefixIconColor: Colors.grey,
suffixIconColor: Colors.grey,
labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
border: const OutlineInputBorder().copyWith(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.grey),
),
enabledBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.grey),
),
focusedBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.black12),
),
errorBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.red),
),
focusedErrorBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.orange),
),
 );

 static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
errorMaxLines: 3,
prefixIconColor: Colors.grey,
suffixIconColor: Colors.grey,
labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
border: const OutlineInputBorder().copyWith(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.grey),
),
enabledBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.grey),
),
focusedBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.white),
),
errorBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.red),
),
focusedErrorBorder: const OutlineInputBorder().copyWith(
   borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(width: 1, color: Colors.orange),
),
 );

static TextTheme lightTextTheme = TextTheme(
  headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color:Colors.black),
  headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
  headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),

  titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color:Colors.black),
  titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color:Colors.black),
  titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color:Colors.black),

  bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color:Colors.black),
  bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color:Colors.black),
  bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color:Colors.black.withOpacity(0.5)),

  labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color:Colors.black),
  labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color:Colors.black.withOpacity(0.5)),
);

static TextTheme darkTextTheme = TextTheme(
  headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color:Colors.white),
  headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
  headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),

  titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color:Colors.white),
  titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color:Colors.white),
  titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color:Colors.white),

  bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color:Colors.white),
  bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color:Colors.white),
  bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color:Colors.white.withOpacity(0.5)),

  labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color:Colors.white),
  labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color:Colors.white.withOpacity(0.5)),

);
}