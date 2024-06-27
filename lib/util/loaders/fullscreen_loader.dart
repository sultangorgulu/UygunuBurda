import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/util/animation/animation_loader.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: AppHelperFunctions.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AppAnimationLoader(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }
    static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}