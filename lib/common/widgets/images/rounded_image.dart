import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key, this.width, this.height, required this.imageUrl, this.applyImageRadius = true, this.border,  this.backgroundColor = AppColors.light, this.fit = BoxFit.contain, this.padding, this.isNetworkImage = false, this.onPressed, this.borderRadius = AppSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.md)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.md),
          child: Image(fit: fit, image:isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,),
          )
      ),
    );
  }
}

