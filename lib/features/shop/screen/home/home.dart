import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/location_bar.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:uygunuburda/common/widgets/layouts/grid_layout.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screen/all_products/all_products.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/home_appbar.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/home_categories.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/promo_slider.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppHomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  AppSearchContainer(text: 'Ürün Arayın'),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        AppSectionHeading(
                          title: 'Popüler Kategoriler',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems),
                        AppHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: LocationBar(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppPromoSlider(),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  AppSectionHeading(
                    title: 'Popüler Ürünler',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  AppGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const AppProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}