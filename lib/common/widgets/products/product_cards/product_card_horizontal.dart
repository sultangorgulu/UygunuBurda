import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/icons/circular_icons.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:uygunuburda/common/widgets/texts/product_price_text.dart';
import 'package:uygunuburda/common/widgets/texts/product_title_text.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppProductCardHorizontal extends StatelessWidget {
  const AppProductCardHorizontal ({super.key});

  @override 
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Container(
      width:310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.softGrey,
      ),
      child: Row(
        children: [
          AppRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(AppSizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.light,
            child:  Stack(
              children:[
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: AppRoundedImage(imageUrl: AppImages.productImage1, applyImageRadius: true,)
                ),
                
                Positioned(
                  top:12,
                  child: AppRoundedContainer(
                    radius: AppSizes.sm,
                    backgroundColor: AppColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
                    child: Text('%25', style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.black)),
                  ),
                ),

                const Positioned(
                  top: 0,
                  right: 0,
                  child: AppCircularIcon(icon: Iconsax.heart, color: Colors.red),
                ),

                const SizedBox(
                  width: 172,
                  child: Column(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppProductTitleText(title: 'ürün', smallSize: true),
                            SizedBox(height: AppSizes.spaceBtwItems / 2),
                            AppBrandTitleWithVerifiedIcon(title: 'marka'),
                          ],
                          ),

                          Spacer(),
                    ]
                  )
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(child: AppProductPriceText(price: '200')),

                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(AppSizes.productImageRadius),
                                ),
                              ),
                              child: const SizedBox(
                                width: AppSizes.iconLg * 1.2,
                                height: AppSizes.iconLg * 1.2,
                                child: Center(child: Icon(Iconsax.add, color: AppColors.white)),
                              )
                            )

                          ],
                          ),
                    ],
                    ),
                )


              ]
            )
          );
        
    
    
  }
}