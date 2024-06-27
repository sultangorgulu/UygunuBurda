import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppProductContainer extends StatelessWidget {
  const AppProductContainer({
    super.key,
    this.onPressed,
    required this.showBorder,
    required this.brand,
  });

  final VoidCallback? onPressed;
  final bool showBorder;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final isdark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onPressed,
      child: AppRoundedContainer(
        showborder: true,
        padding: const EdgeInsetsDirectional.all(AppSizes.sm),
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(
                  color: AppHelperFunctions.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: AppRoundedImage(
                  imageurl: brand.image,
                  isNetworkImage: brand.image == '' ? false : true,
                  backgroundcolor: Colors.transparent,
                  overlaycolor: isdark ? AppColors.white : AppColors.black,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          brand.name,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: AppColors.primary,
                        size: AppSizes.iconXs,
                      )
                    ],
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}