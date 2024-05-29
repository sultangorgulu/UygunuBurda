import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/bottom_add_to_favs_widget.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_attributes.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_detail_image_slider.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_meta_data.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: const AppBottomAddToFavs(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppProductImageSlider(),

            Padding(
              padding: const EdgeInsets.only(right: AppSizes.defaultSpace, left: AppSizes.defaultSpace, bottom: AppSizes.defaultSpace),
              child: Column(
                children: [

                  const AppProductMetaData(),
                  
                  const AppProductAttributes(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  //--checkout

                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  //--açıklama

                  const AppSectionHeading(title: 'Açıklama', showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const ReadMoreText(
                    'bu ürün açıklamasıdır.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText:' daha fazla',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize:14, fontWeight: FontWeight.w800),
                  )

                ],
                )
              ),
          ],
        )
      )
    );
  }
}

