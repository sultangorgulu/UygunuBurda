import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';

class AppShadowStyle {
  
  static final verticalProductShadow = BoxShadow(
    color: AppColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: AppColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)

  );
}