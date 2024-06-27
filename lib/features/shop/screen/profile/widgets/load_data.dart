import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/database/banner_cloud.dart';
import 'package:uygunuburda/database/brand_category_cloud.dart';
import 'package:uygunuburda/database/brand_cloud.dart';
import 'package:uygunuburda/database/category_cloud.dart';
import 'package:uygunuburda/database/products_category_cloud.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/load_data_tile.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/section_title.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final categoryCloud = Get.find<CategoryCloud>();
    final bannerCloud = Get.find<BannerCloud>();
    final productCloud = Get.put(ProductsCloud());
    final brandCloud = Get.put(BrandCloud());
    final brandCategoryCloud = Get.put(BrandCategoryCloud());
    final productCategoryCloud = Get.put(ProductCategoryCloud());

    return Scaffold(
      appBar: const AppAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppSectionTitle(
                title: 'Main Record',
                showactionbutton: false,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Column(
                children: [
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.category,
                      color: AppColors.primary,
                    ),
                    title: 'Upload Categories',
                    onPressed: () async {
                      try {
                        // Burada DummyData.categories yerine Firestore'dan veri yükleme işlemi yapılabilir.
                        // Örneğin:
                        // await categoryCloud.uploadCategoriesFromFirestore();
                      } catch (e) {
                        // Hata yönetimi
                      }
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.shop,
                      color: AppColors.primary,
                    ),
                    title: 'Upload Brands',
                    onPressed: () async {
                      try {
                        // Burada DummyData.brands yerine Firestore'dan veri yükleme işlemi yapılabilir.
                        // Örneğin:
                        // await brandCloud.uploadBrandsFromFirestore();
                      } catch (e) {
                        // Hata yönetimi
                      }
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.shopping_cart,
                      color: AppColors.primary,
                    ),
                    title: 'Upload Products',
                    onPressed: () async {
                      try {
                        // Burada DummyData.products yerine Firestore'dan veri yükleme işlemi yapılabilir.
                        // Örneğin:
                        // await productCloud.uploadProductsFromFirestore();
                      } catch (e) {
                        // Hata yönetimi
                      }
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: AppColors.primary,
                    ),
                    title: 'Upload Banners',
                    onPressed: () async {
                      try {
                        // Burada DummyData.banners yerine Firestore'dan veri yükleme işlemi yapılabilir.
                        // Örneğin:
                        // await bannerCloud.uploadBannersFromFirestore();
                      } catch (e) {
                        // Hata yönetimi
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              const AppSectionTitle(
                title: 'Relationships',
                showactionbutton: false,
              ),
              Text(
                'Make sure you have already uploaded all the content above.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Column(
                children: [
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: AppColors.primary,
                    ),
                    title: 'Upload Brands & Categories Relation Data',
                    onPressed: () async {
                      try {
                        // Burada DummyData.brandcategory yerine Firestore'dan veri yükleme işlemi yapılabilir.
                        // Örneğin:
                        // await brandCategoryCloud.uploadBrandCategoryFromFirestore();
                      } catch (e) {
                        // Hata yönetimi
                      }
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: AppColors.primary,
                    ),
                    title: 'Upload Product Categories Relational Data',
                    onPressed: () async {
                      try {
                        // Burada DummyData.prodctcategory yerine Firestore'dan veri yükleme işlemi yapılabilir.
                        // Örneğin:
                        // await productCategoryCloud.uploadProductCategoryFromFirestore();
                      } catch (e) {
                        // Hata yönetimi
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
