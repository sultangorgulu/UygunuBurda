import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/category_model.dart';
import 'package:uygunuburda/features/personalization/controllers/category_controller.dart';
import 'package:uygunuburda/features/shop/screen/all_products/all_products.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/product_item.dart';
import 'package:uygunuburda/features/shop/screen/store/widgets/category_brand.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/gridview.dart';
import 'package:uygunuburda/util/shared/section_title.dart';
import 'package:uygunuburda/util/shared/shimmers/vertical_shimmer_effect.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                FutureBuilder(
                    future: controller.getCategoryProducts(category.id),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      final response =
                          AppCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const AppVerticalShimmerEffect());

                      if (response != null) return response;
                      return Column(
                        children: [
                          AppSectionTitle(
                            title: 'You might like',
                            onPressed: () {
                              Get.to(() => ViewAllProductsScreen(
                                    title: category.name,
                                    futuremethod: controller
                                        .getCategoryProducts(category.id),
                                  ));
                            },
                          ),
                          const SizedBox(height: AppSizes.spaceBtwItems),
                          AppGridView(
                            itemcount: snapshot.data!.length,
                            itembuilder: (context, index) {
                              return ProductCardVertical(
                                product: snapshot.data![index],
                              );
                            },
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}