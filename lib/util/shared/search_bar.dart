import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/device/device_utility.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.onSearch,
    required this.onSubmit,
    required this.showbackground,
    required this.showborder,
    this.icon = Iconsax.search_normal,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final IconData? icon;
  final ValueChanged<String> onSearch;
  final ValueChanged<String> onSubmit;
  final bool showbackground, showborder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isdark = AppHelperFunctions.isDarkMode(context);
    TextEditingController _controller = TextEditingController();
    return Padding(
      padding: padding,
      child: Container(
        width: AppDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: AppSizes.sm), // Yüksekliği azaltmak için vertical padding
        decoration: BoxDecoration(
          color: showbackground
              ? isdark
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
          borderRadius:
              showborder ? BorderRadius.circular(AppSizes.cardRadiusMd) : null,
          border: Border.all(
            color: AppColors.grey.withOpacity(0.2), // Daha transparan renk
          ),
        ),
        child: Row(
          children: [

            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '   Search...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // TextField içindeki padding
                ),
                onChanged: onSearch,
                onSubmitted: onSubmit,
              ),
            ),
            IconButton(
              icon: Icon(Iconsax.search_normal),
              onPressed: () {
                onSubmit(_controller.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
