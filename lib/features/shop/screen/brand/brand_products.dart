import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/products/sortable/sortable_products.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/features/personalization/controllers/brand_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/product_container.dart';
import 'package:uygunuburda/util/shared/shimmers/vertical_shimmer_effect.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandcontroller = BrandController.instance;

    return Scaffold(
      appBar: AppAppBar(
        title: Text(brand.name),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppProductContainer(showBorder: true, brand: brand),
              const SizedBox(height: AppSizes.spaceBtwSections),
              FutureBuilder(
                  future: brandcontroller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    final widget = AppCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: const AppVerticalShimmerEffect(),
                    );
                    if (widget != null) return widget;
                    return SortableProducts(products: snapshot.data!);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}