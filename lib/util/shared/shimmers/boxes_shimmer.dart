import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppBoxesShimmer extends StatelessWidget {
  const AppBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: AppShimmerEffect(width: 150, height: 110)),
            SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: AppShimmerEffect(width: 150, height: 110)),
            SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: AppShimmerEffect(width: 150, height: 110)),
            SizedBox(width: AppSizes.spaceBtwItems),
          ],
        )
      ],
    );
  }
}