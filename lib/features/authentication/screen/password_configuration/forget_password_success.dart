import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/device/device_utility.dart';

class ForgetPasswordSuccessScreen extends StatelessWidget {
  const ForgetPasswordSuccessScreen({
    super.key,
    required this.email,
  });

  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(CupertinoIcons.clear),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppDeviceUtils.getAppBarHeight() / 2,
              right: AppSizes.defaultSpace,
              left: AppSizes.defaultSpace,
              bottom: AppSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(AppImages.deliveredEmailIllustration),
                ),
                Text(
                  AppTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  email,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  AppTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: const Text(AppTexts.done),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                TextButton(
                  onPressed: () {
                    controller.resendResetPasswordEmail(email);
                  },
                  child: const Text(AppTexts.resendEmail),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}