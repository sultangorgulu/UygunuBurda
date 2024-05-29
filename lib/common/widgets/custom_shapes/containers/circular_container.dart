import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';

class AppCircularContainer extends StatelessWidget {
  const AppCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height= 400,
    this.radius = 400,
    this.padding= 0,
    this.margin ,
    this.backgroundColor = AppColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: AppColors.textWhite.withOpacity(0.1),
      ),
    );
  }
}