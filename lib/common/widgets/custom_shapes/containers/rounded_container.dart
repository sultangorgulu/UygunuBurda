import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppRoundedContainer extends StatelessWidget {
  const AppRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.radius = AppSizes.productImageRadius,
    this.margin,
    this.backgroundcolor = AppColors.white,
    this.child,
    this.bordercolor = AppColors.borderPrimary,
    this.showborder = false,
  });

  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color backgroundcolor;
  final Widget? child;
  final Color bordercolor;
  final bool showborder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor,
        border: showborder ? Border.all(color: bordercolor) : null,
      ),
      child: child,
    );
  }
}