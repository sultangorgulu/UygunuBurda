import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({
    super.key,
    this.itemcount = 6,
  });

  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemcount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              Flexible(
                  child: AppShimmerEffect(width: 55, height: 55, radius: 55)),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Flexible(child: AppShimmerEffect(width: 55, height: 55)),
            ],
          );
        },
      ),
    );
  }
}