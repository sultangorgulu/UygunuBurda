import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                  const SizedBox(width: AppSizes.spaceBtwItems / 2),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '5.0',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const TextSpan(text: '(199)'),
                  ]))
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: AppSizes.md,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Row(
            children: [
              AppRoundedImage(
                imageurl: product.brand != null ? product.brand!.image : '',
                height: 32,
                width: 32,
                backgroundcolor: dark ? AppColors.dark : AppColors.light,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Text(
                product.brand != null ? product.brand!.name : '',
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
