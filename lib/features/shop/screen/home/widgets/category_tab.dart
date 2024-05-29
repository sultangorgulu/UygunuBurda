import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/brands/brand_show_case.dart';
import 'package:uygunuburda/common/widgets/layouts/grid_layout.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key});

  @override 
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics () ,
      children: [
       Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    const AppBrandShowcase(images: [AppImages.productImage1,AppImages.productImage1]),
                    const AppBrandShowcase(images: [AppImages.productImage1,AppImages.productImage1]),
 
                    const SizedBox(height: AppSizes.spaceBtwItems),
      
                    AppSectionHeading(title: 'Bunları da Beğenebilirsiniz', onPressed: () {}),
                    const SizedBox(height: AppSizes.spaceBtwItems),
      
                    AppGridLayout(itemCount:4, itemBuilder: (_, index) => const AppProductCardVertical())
                  ]
                )
               ),
      ]
    );      
          }
}