import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/device/device_utility.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.actions,
    this.leadingicon,
    this.leadingOnPressed,
    this.showbackarrow = false,
    this.title,
  });

  final List<Widget>? actions;
  final IconData? leadingicon;
  final Widget? title;
  final VoidCallback? leadingOnPressed;
  final bool showbackarrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              )
            : leadingicon != null
                ? IconButton(
                    onPressed: () => leadingOnPressed,
                    icon: Icon(leadingicon),
                  )
                : null,
        actions: actions,
        title: title,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}