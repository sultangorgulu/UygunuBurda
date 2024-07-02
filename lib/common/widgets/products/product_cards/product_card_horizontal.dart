import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/texts/product_price_text.dart';
import 'package:uygunuburda/common/widgets/texts/product_title_text.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/features/personalization/controllers/product_controller.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/favorite_icon.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';
import 'package:uygunuburda/util/shared/verified_icon_text.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final productcontroller = ProductController.instance;
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color: dark ? AppColors.darkGrey : AppColors.softGrey,
      ),
      child: Row(
        children: [
          AppRoundedContainer(
            height: 120,
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
                    ),
                  ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: FavoriteIcon(productId: product.id),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 190,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.sm, left: AppSizes.sm),
              child: Column(
                children: [
                  Column(
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
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            AppProductPriceText(
                                price:
                                    productcontroller.getProductPrice(product)),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              AppSizes.cardRadiusMd,
                            ),
                            bottomRight:
                                Radius.circular(AppSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          height: AppSizes.iconLg * 1.2,
                          width: AppSizes.iconLg * 1.2,
                          child: Icon(
                            Iconsax.add,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}