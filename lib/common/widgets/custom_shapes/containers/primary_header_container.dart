
import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:uygunuburda/util/constants/colors.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({
    super.key, required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgeWidget(
      child: Container(
            color: AppColors.primary,
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              height:400,
              child: Stack(
    children: [
      Positioned(top: -150, right: -250, child: AppCircularContainer(backgroundColor: AppColors.textWhite.withOpacity(0.1))),
      Positioned(top: 100, right: -300, child: AppCircularContainer(backgroundColor: AppColors.textWhite.withOpacity(0.1))),
    ],
              ),
            ),
          ),
    );
  }
}