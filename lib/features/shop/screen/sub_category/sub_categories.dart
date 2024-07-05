import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:uygunuburda/features/authentication/models/model/category_model.dart';
import 'package:uygunuburda/features/personalization/controllers/category_controller.dart';
import 'package:uygunuburda/features/shop/screen/all_products/all_products.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/section_title.dart';
import 'package:uygunuburda/util/shared/shimmers/horizontal_shimmer_effect.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: AppAppBar(
        title: Text(category.name),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppRoundedImage(
                imageurl: AppImages.promoBanner3,
                width: double.infinity,
                roundedborder: true,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    final widget = AppCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const AppHorizaontalShimmerEffect());

                    if (widget != null) return widget;
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                              children: [
                                AppSectionTitle(
                                  title: snapshot.data![index].name,
                                  onPressed: () => Get.to(
                                    () => ViewAllProductsScreen(
                                      title: snapshot.data![index].name,
                                      futuremethod:
                                          controller.getCategoryProducts(
                                              snapshot.data![index].id),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    height: AppSizes.spaceBtwItems / 2),
                                FutureBuilder(
                                    future: controller.getCategoryProducts(
                                        snapshot.data![index].id),
                                    builder: (context, snapshot) {
                                      final widget = AppCloudHelperFunctions
                                          .checkMultiRecordState(
                                        snapshot: snapshot,
                                        loader:
                                            const AppHorizaontalShimmerEffect(),
                                      );

                                      if (widget != null) return widget;
                                      return SizedBox(
                                        height: 120,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              ProductCardHorizontal(
                                            product: snapshot.data![index],
                                          ),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                  width: AppSizes.spaceBtwItems),
                                          itemCount: snapshot.data!.length,
                                        ),
                                      );
                                    }),
                              ],
                            ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}