import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppProductImageSlider extends StatelessWidget {
  const AppProductImageSlider({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
        final dark = AppHelperFunctions.isDarkMode(context);
    return AppCurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.light,
        child:  Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(AppImages.productImage1))),
              ),
            ),
    
            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_,__) => const SizedBox(width: AppSizes.spaceBtwItems),
                  itemBuilder: (_, index) => AppRoundedImage(
                    width: 80,
                    backgroundColor:  dark ? AppColors.dark : AppColors.white,
                    border: Border.all(color:AppColors.primary),
                    padding: const EdgeInsets.all(AppSizes.sm),
                    imageUrl: AppImages.productImage1,
                  ),
                ),
              ),
            ),

            const AppAppBar(

            )
          ]
        )
      )
    );
  }
}