import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppVerifiedIconWithText extends StatelessWidget {
  const AppVerifiedIconWithText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(width: AppSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: AppColors.primary,
          size: AppSizes.iconXs,
        )
      ],
    );
  }
}