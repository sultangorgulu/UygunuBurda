import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Get.off(() => LoginScreen()); // Onboarding ekranını geç ve login ekranına git
    }
  }

  void skipPage() {
    Get.off(() => LoginScreen()); // Onboarding ekranını geç ve login ekranına git
  }
}
