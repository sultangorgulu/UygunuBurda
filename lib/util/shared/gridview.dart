
import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppGridView extends StatelessWidget {
  const AppGridView({
    super.key,
    required this.itemcount,
    this.mainaxisextent = 288,
    required this.itembuilder,
  });

  final int itemcount;
  final double mainaxisextent;
  final Widget? Function(BuildContext, int) itembuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemcount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainaxisextent,
      ),
      itemBuilder: itembuilder,
    );
  }
}
