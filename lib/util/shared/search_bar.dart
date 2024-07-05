import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/device/device_utility.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.text,
    required this.showbackground,
    required this.showborder,
    this.icon = Iconsax.search_normal,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final IconData? icon;
  final String text;
  final bool showbackground, showborder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isdark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: AppDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: showbackground
              ? isdark
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
          borderRadius:
              showborder ? BorderRadius.circular(AppSizes.cardRadiusLg) : null,
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.darkGrey,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: text,
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
                style: Theme.of(context).textTheme.bodySmall,
                onChanged: (value) {
                  // Burada arama işlemi için bir işlevi çağırabilirsiniz
                  print("Arama yapılıyor: $value");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
