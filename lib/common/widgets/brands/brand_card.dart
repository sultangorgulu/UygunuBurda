import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/enum.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppBrandCard extends StatelessWidget {
  const AppBrandCard ({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override 
  Widget build (BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: AppRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child:AppCircularImage(
                isNetworkImage: false,
                image: AppImages.storeIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? AppColors.white : AppColors.black,
              ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems / 2),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBrandTitleWithVerifiedIcon(title: 'title', brandTextSize: TextSizes.large),
                    Text(
                      '50 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                  )
                )
          ],
        )
      )
    );
  }
}