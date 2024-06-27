import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:uygunuburda/features/authentication/screen/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:uygunuburda/features/authentication/screen/onboarding/widgets/onboarding_next_button.dart';
import 'package:uygunuburda/features/authentication/screen/onboarding/widgets/onboarding_page.dart';
import 'package:uygunuburda/features/authentication/screen/onboarding/widgets/onboarding_skip.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage4,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBordingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
