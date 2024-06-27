// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/device/device_utility.dart';

class EmailVerifySuccessScreen extends StatelessWidget {
  const EmailVerifySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppDeviceUtils.getAppBarHeight(),
              right: AppSizes.defaultSpace,
              left: AppSizes.defaultSpace,
              bottom: AppSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(AppImages.staticSuccessIllustration),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                Text(
                  AppTexts.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  AppTexts.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text(AppTexts.appContinue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}