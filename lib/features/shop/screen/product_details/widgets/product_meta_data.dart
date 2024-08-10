import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/texts/product_title_text.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/features/personalization/controllers/product_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '\₺${productController.getProductPrice(product)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          AppProductTitleText(title: product.title),
          const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
          Row(
            children: [
              if (product.brand?.image != null && product.brand!.image.isNotEmpty) 
                AppRoundedImage(
                  imageurl: product.brand!.image,
                  height: 32,
                  width: 32,
                  backgroundcolor: dark ? AppColors.dark : AppColors.light,
                )
              else
                Container(
                  height: 32,
                  width: 32,
                  color: AppColors.grey, // Placeholder color
                ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                product.brand != null ? product.brand!.name : 'No Brand',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(width: AppSizes.xs),
              const Icon(
                Iconsax.verify5,
                color: AppColors.primary,
                size: AppSizes.iconXs,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
