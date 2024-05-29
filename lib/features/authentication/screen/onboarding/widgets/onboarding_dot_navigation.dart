import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uygunuburda/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class OnBordingDotNavigation extends StatelessWidget {
  const OnBordingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final controller = OnBoardingController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: 50.0,
      left: 16.0,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 4,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotHeight: 6,      ),
      )
    );
  }
}