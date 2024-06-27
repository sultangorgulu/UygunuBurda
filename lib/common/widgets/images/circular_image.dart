import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = AppSizes.sm,
    this.backgroundColor,
    this.overlayColor,
    this.isNetworkImage = false,
    required this.image,
    this.fit = BoxFit.cover,
  });

  final double width, height, padding;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (AppHelperFunctions.isDarkMode(context)
                ? AppColors.black
                : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius:BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const AppShimmerEffect(width: 55, height: 55,radius: 55,),
            errorWidget: (context,url,error)=>const Icon (Icons.error),

                )
              : Image(
                  fit: fit,
                  image: AssetImage(image) ,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}