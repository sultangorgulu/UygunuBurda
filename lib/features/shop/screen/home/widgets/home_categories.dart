import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/features/authentication/models/controller/category_controller.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/category_shimmer.dart';
import 'package:uygunuburda/features/shop/screen/sub_category/sub_categories.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({super.key});

   @override
  Widget build(BuildContext context) {
    final categorycontroller = Get.put(CategoryController());
    return Obx(() {
      if (categorycontroller.isloading.value) return const AppCategoryShimmer();
      if (categorycontroller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: AppColors.white),
          ),
        );
      }
      return SizedBox(
        height: 81,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: categorycontroller.featuredCategories.length,
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSizes.spaceBtwItems),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categorycontroller.featuredCategories[index];
            return Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.spaceBtwItems,
              ),
              child: GestureDetector(
                onTap: () =>
                    Get.to(() => SubCategoriesScreen(category: category)),
                child: Column(
                  children: [
                    AppRoundedImage(
                      width: 55,
                      height: 55,
                      imageurl: category.image,
                      borderradius: 100,
                      boxFit: BoxFit.fitWidth,
                      padding: const EdgeInsets.all(AppSizes.sm),
                      isNetworkImage: true,
                      overlaycolor: AppHelperFunctions.isDarkMode(context)
                          ? AppColors.light
                          : AppColors.dark,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems / 2),
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: AppColors.white,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}