import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/personalization/controllers/favorite_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(FavoriteController());
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: dark
              ? AppColors.black.withOpacity(0.9)
              : AppColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
            onPressed: () => controller.toogleFavoriteProduct(productId),
            icon: Icon(
              controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
              color: controller.isFavorite(productId) ? AppColors.error : null,
              size: AppSizes.lg,
            )),
      ),
    );
  }
}