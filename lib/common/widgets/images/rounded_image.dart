import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key,
    this.width,
    this.applyImageRadius = true,
    this.height,
    required this.imageurl,
    this.backgroundcolor = AppColors.light,
    this.padding,
    this.border,
    this.boxFit = BoxFit.contain,
    this.isNetworkImage = false,
    this.onPressed,
    this.roundedborder = false,
    this.borderradius = AppSizes.md,
    this.overlaycolor,
  });

  final double? height, width;
  final String imageurl;
  final bool roundedborder;
  final BoxFit boxFit;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color backgroundcolor;
  final Color? overlaycolor;
  final BoxBorder? border;
  final double borderradius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(borderradius),
        ),
        child: ClipRRect(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: boxFit,
                  imageUrl: imageurl,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const AppShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : imageurl != ''
                  ? Image(
                      image: AssetImage(imageurl),
                      fit: boxFit,
                      color: overlaycolor,
                    )
                  : null,
          borderRadius: roundedborder
              ? BorderRadius.circular(borderradius)
              : BorderRadius.zero,
        ),
      ),
    );
  }
}