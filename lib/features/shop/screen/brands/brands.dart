import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/personalization/controllers/brand_controller.dart';
import 'package:uygunuburda/features/shop/screen/brand/brand_products.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/shimmers/brand_shimmer.dart';
import 'package:uygunuburda/util/shared/gridview.dart';
import 'package:uygunuburda/util/shared/product_container.dart';
import 'package:uygunuburda/util/shared/section_title.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandcontroller = BrandController.instance;
    return Scaffold(
      appBar: const AppAppBar(
        title: Text('Brands'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppSectionTitle(
                title: 'Brands',
                showactionbutton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Obx(() {
                if (brandcontroller.isloading.value) {
                  return const AppBrandShimmer();
                }

                if (brandcontroller.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }

                return AppGridView(
                  itemcount: brandcontroller.allBrands.length,
                  mainaxisextent: 80,
                  itembuilder: (context, index) {
                    final brand = brandcontroller.allBrands[index];
                    return AppProductContainer(
                      showBorder: true,
                      brand: brand,
                      onPressed: () =>
                          Get.to(() => BrandProducts(brand: brand)),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}