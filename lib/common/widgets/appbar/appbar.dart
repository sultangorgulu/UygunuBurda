import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/device/device_utility.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,

    });

    final Widget? title;
    final bool showBackArrow;
    final IconData? leadingIcon;
    final List<Widget> ? actions;
    final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding:const EdgeInsets.symmetric(horizontal: AppSizes.md),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow 
      ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)) 
      : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,

    ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}