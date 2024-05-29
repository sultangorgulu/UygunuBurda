import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppFormDivider extends StatelessWidget {
  const AppFormDivider({
    super.key,
    required this.dividerText
  });


  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? AppColors.darkGrey: AppColors.grey, thickness: 0.5, indent: 60, endIndent:5)),
        Text (AppTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? AppColors.darkGrey: AppColors.grey, thickness: 0.5, indent: 5, endIndent:60)),
      ],
    );
  }
}