import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/device/device_utility.dart';
import 'package:uygunuburda/util/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppDeviceUtils.getAppBarHeight() / 2,
              right: AppSizes.defaultSpace,
              left: AppSizes.defaultSpace,
              bottom: AppSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  AppTexts.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                Form(
                  key: controller.forgetpasswordkey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: AppValidator.validateEmail,
                    decoration: const InputDecoration(
                      labelText: AppTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.sendResetPasswordEmail();
                      },
                      child: const Text(
                        AppTexts.submit,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}