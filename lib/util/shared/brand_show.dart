import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/features/shop/screen/brand/brand_products.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';
import 'package:uygunuburda/util/shared/product_container.dart';

class AppBrandShow extends StatelessWidget {
  const AppBrandShow({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: AppRoundedContainer(
        showborder: true,
        backgroundcolor: Colors.transparent,
        padding: const EdgeInsets.all(AppSizes.md),
        bordercolor: AppColors.darkGrey,
        margin: const EdgeInsets.all(AppSizes.spaceBtwItems),
        child: Column(
          children: [
            AppProductContainer(showBorder: true, brand: brand),
            Row(
                children:
                    images.map((image) => brandImages(image, context)).toList())
          ],
        ),
      ),
    );
  }

  Widget brandImages(String image, context) {
    return Expanded(
      child: AppRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(AppSizes.sm),
        margin: const EdgeInsets.all(AppSizes.sm),
        backgroundcolor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.darkGrey
            : AppColors.light,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}