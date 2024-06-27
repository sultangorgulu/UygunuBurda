import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/gridview.dart';

class AppVerticalShimmerEffect extends StatelessWidget {
  const AppVerticalShimmerEffect({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppGridView(
      itemcount: itemCount,
      itembuilder: (context, index) {
        return const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerEffect(width: 180, height: 180),
              SizedBox(height: AppSizes.spaceBtwItems),
              AppShimmerEffect(width: 160, height: 15),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              AppShimmerEffect(width: 110, height: 15),
            ],
          ),
        );
      },
    );
  }
}