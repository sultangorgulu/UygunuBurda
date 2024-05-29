import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/device/device_utility.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar ({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AppColors.black :AppColors.white,
      child: TabBar (
        tabs: tabs,
        isScrollable: true,
        indicatorColor:AppColors.primary,
        labelColor: dark ? AppColors.white : AppColors.primary,unselectedLabelColor: AppColors.darkGrey,
        )
    );
  }

  @override 
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}