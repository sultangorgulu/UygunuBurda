import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:uygunuburda/common/widgets/texts/product_price_text.dart';
import 'package:uygunuburda/common/widgets/texts/product_title_text.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/enum.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({
    super.key,
  });

  @override 
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
       Row(
         children: [
           AppRoundedContainer(
            radius: AppSizes.sm,
            backgroundColor: AppColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
            child: Text('%25', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
           ),
          const SizedBox(width: AppSizes.spaceBtwItems),

            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: AppSizes.spaceBtwItems),
            const AppProductPriceText(price: '175', isLarge: true),

         ],
       ),
            const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

            const SizedBox(height: AppSizes.spaceBtwItems /1.5),
            const AppProductTitleText(title: 'çikolata'),

            Row(
              children: [
                AppCircularImage(
                  image: AppImages.productImage1,
                  width:32,
                  height: 32,
                  overlayColor: darkMode ? AppColors.white : AppColors.black,
                  ),
                  const AppBrandTitleWithVerifiedIcon(title: 'title', brandTextSize: TextSizes.medium)
              ],
            )



      ]

    );
  }
}