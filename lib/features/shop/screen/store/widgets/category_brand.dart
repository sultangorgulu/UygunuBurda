import 'package:flutter/material.dart';
import 'package:uygunuburda/features/authentication/models/model/category_model.dart';
import 'package:uygunuburda/features/personalization/controllers/brand_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/brand_show.dart';
import 'package:uygunuburda/util/shared/shimmers/boxes_shimmer.dart';
import 'package:uygunuburda/util/shared/shimmers/list_tile_shimmers.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, firstsnapshot) {
          const loader = Column(
            children: [
              AppListTileShimmer(),
              SizedBox(height: AppSizes.spaceBtwItems),
              AppBoxesShimmer(),
              SizedBox(height: AppSizes.spaceBtwItems),
            ],
          );

          final widget = AppCloudHelperFunctions.checkMultiRecordState(
              snapshot: firstsnapshot, loader: loader);

          if (widget != null) return widget;

          print('snapshot.data!.length is ${firstsnapshot.data!.length}');

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: firstsnapshot.data!.length,
            itemBuilder: (context, index) {
              final brand = firstsnapshot.data![index];
              print(brand.toJson());
              return FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    final widget = AppCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;
                    return AppBrandShow(
                      brand: brand,
                      images: snapshot.data!.map((e) => e.thumbnail).toList(),
                    );
                  });
            },
          );
        });
  }
}