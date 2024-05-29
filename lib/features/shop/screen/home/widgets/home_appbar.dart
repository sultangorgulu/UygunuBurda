import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/products/cart_menu_icon.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      title: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
    Text(AppTexts.homeAppbarTitle, style: Theme.of(context). textTheme.labelMedium!.apply(color:AppColors.grey)),
    Text(AppTexts.homeAppbarSubTitle, style: Theme.of(context). textTheme.headlineSmall!.apply(color:AppColors.white)),
    ],
    ),
    actions: [
      AppCartCounterIcon(onPressed: () {}, iconColor: AppColors.white)
    ],
     );
  }
}

