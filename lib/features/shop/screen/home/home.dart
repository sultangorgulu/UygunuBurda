// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uygunuburda/features/personalization/controllers/location_controller.dart';
import 'package:uygunuburda/features/personalization/controllers/product_controller.dart';
import 'package:uygunuburda/features/shop/screen/all_products/all_products.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/home_appbar.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/home_categories.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/product_item.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/promo_slider.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/gridview.dart';
import 'package:uygunuburda/util/shared/location_bar.dart';
import 'package:uygunuburda/util/shared/search_bar.dart';
import 'package:uygunuburda/util/shared/section_title.dart';
import 'package:uygunuburda/util/shared/shimmers/vertical_shimmer_effect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      body: GetBuilder<LocationController>( // LocationController'ı GetBuilder içinde başlat
        init: LocationController(),
        builder: (locationController) { // LocationController'ı kullan
          return SingleChildScrollView(
            child: Column(
              children: [
                AppPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      HomeAppBar(),
                      SizedBox(height: AppSizes.spaceBtwSections),

                      SizedBox(height: AppSizes.spaceBtwSections),

                      SizedBox(height: AppSizes.spaceBtwSections),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                        child: Column(
                          children: [
                            AppSectionTitle(
                              title: 'Popular Categories',
                              showactionbutton: false,
                              textcolor: AppColors.white,
                            ),
                            SizedBox(height: AppSizes.spaceBtwItems),
                            AppHomeCategories(),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSizes.spaceBtwItems / 0.3),
                    ],
                  ),
                ),
                AppPromoSlider(),
                SizedBox(height: AppSizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                  child: AppSectionTitle(
                    title: 'Popular Products',
                    showactionbutton: true,
                    onPressed: () => Get.to(() => ViewAllProductsScreen(
                          title: 'Popular Products',
                          query: FirebaseFirestore.instance
                              .collection('Products')
                              .where('IsFeatured', isEqualTo: true)
                              .limit(6),
                          futuremethod:
                              productController.fetchAllFeaturedProducts(),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: Obx(() {
                    if (productController.isloading.value) {
                      return const AppVerticalShimmerEffect();
                    }

                    return AppGridView(
                      itemcount: productController.allProducts.length,
                      itembuilder: (context, index) {
                        return ProductCardVertical(
                          product: productController.allProducts[index],
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}