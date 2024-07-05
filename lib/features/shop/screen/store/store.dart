import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/appbar/tabbar.dart';
import 'package:uygunuburda/features/personalization/controllers/brand_controller.dart';
import 'package:uygunuburda/features/personalization/controllers/category_controller.dart';
import 'package:uygunuburda/features/shop/screen/brand/brand_products.dart';
import 'package:uygunuburda/features/shop/screen/brands/brands.dart';
import 'package:uygunuburda/features/shop/screen/store/widgets/category_tab.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/shimmers/brand_shimmer.dart';
import 'package:uygunuburda/util/shared/gridview.dart';
import 'package:uygunuburda/util/shared/product_container.dart';
import 'package:uygunuburda/util/shared/location_bar.dart';
import 'package:uygunuburda/util/shared/section_title.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = AppHelperFunctions.isDarkMode(context);
    
    final categories = CategoryController.instance.featuredCategories;
    final brandcontroller = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isdark ? AppColors.black : AppColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        LocationSearchBar( // LocationSearchBar eklendi
                        showBackground: true,
                        showBorder: true, onNeighborhoodSelected: (int ) {  },
                      ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        AppSectionTitle(
                          title: 'Featured Brands',
                          showactionbutton: true,
                          onPressed: () => Get.to(() => const BrandsScreen(neighborhood: '',)),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems / 2),
                        Obx(() {
                          if (brandcontroller.isloading.value) {
                            return const AppBrandShimmer();
                          }

                          if (brandcontroller.featuredBrands.isEmpty) {
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
                            itemcount: brandcontroller.featuredBrands.length,
                            mainaxisextent: 80,
                            itembuilder: (context, index) {
                              final brand =
                                  brandcontroller.featuredBrands[index];
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
                  bottom: AppTabBar(
                      tabs: categories
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => AppCategoryTab(category: category))
                    .toList()),
          ),
        ),
      ),
    );
  }
}