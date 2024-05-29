import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppCircularIcon extends StatelessWidget {
  const AppCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = AppSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor, 

  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null 
        ? backgroundColor !
        : AppHelperFunctions.isDarkMode(context)
        ? AppColors.black.withOpacity(0.9)
        : AppColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: () {}, icon:  Icon(icon, color: color, size: size)),
    
    );
  }
}