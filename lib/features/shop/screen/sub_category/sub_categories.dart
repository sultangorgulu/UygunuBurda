import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: Text('Şarküteri'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppRoundedImage(
                width: double.infinity,
                imageUrl: AppImages.productImage1,
                applyImageRadius: true,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Column(
                children: [
                  AppSectionHeading(title: 'ürün1', onPressed: () {}),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                          const AppProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}