import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppHorizaontalShimmerEffect extends StatelessWidget {
  const AppHorizaontalShimmerEffect({super.key, this.itemcount = 4});

  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSizes.spaceBtwItems),
        itemCount: itemcount,
        itemBuilder: (context, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppShimmerEffect(width: 120, height: 120),
            SizedBox(width: AppSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 160, height: 15),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 110, height: 15),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 80, height: 15),
                //  Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}