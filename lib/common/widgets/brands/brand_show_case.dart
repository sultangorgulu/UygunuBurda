import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/brands/brand_card.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppBrandShowcase extends StatelessWidget {
  const AppBrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Column(
        children: [
          const AppBrandCard(showBorder: false),
          const SizedBox(height: AppSizes.spaceBtwItems),
    
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
            
        ]
      )
    );
  }

    Widget brandTopProductImageWidget(String image, context) {
      return Expanded(
        child: AppRoundedContainer(
          height: 100,
          padding: const EdgeInsets.all(AppSizes.md),
          margin: const EdgeInsets.only(right: AppSizes.sm),
          backgroundColor: AppHelperFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
          child:Image(fit: BoxFit.contain, image: AssetImage(image)),
        )
        );
    }
  
}