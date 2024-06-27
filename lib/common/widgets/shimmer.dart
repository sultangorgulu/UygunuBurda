import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppShimmerEffect extends StatelessWidget {
  const AppShimmerEffect({super.key,
    required this.width,
    required this.height,
    this.radius=15,
    this.color});

  final double width,height,radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark=AppHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark?Colors.grey[850]!:Colors.grey[300]!,
      highlightColor: dark? Colors.grey[750]!:Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color??(dark?AppColors.darkGrey:AppColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}