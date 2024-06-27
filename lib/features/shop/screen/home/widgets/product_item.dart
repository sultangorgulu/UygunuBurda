import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/texts/product_title_text.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/features/personalization/controllers/product_controller.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/favorite_icon.dart';
import 'package:uygunuburda/features/shop/screen/product_details/product_detail.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';
import 'package:uygunuburda/util/shared/box_shadow.dart';
import 'package:uygunuburda/util/shared/verified_icon_text.dart';

class AppProductItem extends StatelessWidget {
  const AppProductItem({
    super.key,
    this.ontap,
    required this.product,
  });

  final VoidCallback? ontap;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final productcontroller = ProductController.instance;

    return GestureDetector(
      onTap: ontap ?? () {
        Get.to(() => ProductDetailScreen(product: product));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [AppBoxShadow.verticalboxshadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: dark ? AppColors.darkGrey : AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundcolor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  AppRoundedImage(
                    imageurl: product.thumbnail,
                    roundedborder: true,
                    isNetworkImage: true,
                  ),
                  Positioned(
                    top: 10,
                    child: AppRoundedContainer(
                      radius: AppSizes.sm,
                      backgroundcolor: AppColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.xs,
                      ),
                      child: const SizedBox.shrink(), // İçerik eklenmemişse boş bir alan bırakın.
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: FavoriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(
                    title: product.title,
                    smallsize: true,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  AppVerifiedIconWithText(text: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.xs),
              child: Text(
                productcontroller.getProductPrice(product),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
