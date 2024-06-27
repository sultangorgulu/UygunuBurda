import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/util/shared/gridview.dart';

class AppBrandShimmer extends StatelessWidget {
  const AppBrandShimmer({
    super.key,
    this.itemcount = 4,
  });

  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return AppGridView(
      mainaxisextent: 80,
      itemcount: itemcount,
      itembuilder: (_, __) => const AppShimmerEffect(width: 300, height: 80),
    );
  }
}