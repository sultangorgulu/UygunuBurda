import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppGridLayout extends StatelessWidget {
  const AppGridLayout({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  }) : super(key: key);

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent ?? 288,
      ),
      itemBuilder: (context, index) {
        // itemBuilder ile her bir card için farklı ürün verisi geçiriyoruz
        return itemBuilder(context, index);
      },
    );
  }
}

