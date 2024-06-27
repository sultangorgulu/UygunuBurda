import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({
    super.key, required this.selectedAddress,
  });
  final  bool selectedAddress;

  @override 
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppRoundedContainer(
      width: double.infinity,
      showborder: true,
      backgroundcolor: selectedAddress ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
      bordercolor: selectedAddress ? Colors.transparent : dark ? AppColors.darkerGrey : AppColors.grey,
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top:0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress ? dark ? AppColors.light : AppColors.dark : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sultan Görgülü',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.sm / 2),
              const Text('(+90)541 232 62 65', maxLines:1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: AppSizes.sm / 2 ),
              const Text('bandırma, balıkesir', softWrap:true),

          ],)
        ]
      )

    );
  }
}