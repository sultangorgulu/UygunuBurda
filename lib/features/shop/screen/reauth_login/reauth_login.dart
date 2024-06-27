import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/validators/validation.dart';

class ReAuthLoginScreen extends StatelessWidget {
  const ReAuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AppAppBar(
        title: Text(
          'Re-Authenticate User',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.reAuthemail,
                  validator: AppValidator.validateEmail,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: AppTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                Obx(
                  () => TextFormField(
                    controller: controller.reAuthpassword,
                    validator: (value) => AppValidator.validateEmptyText(
                      'Password',
                      value,
                    ),
                    obscureText: controller.hidepassword.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: AppTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidepassword.value =
                            !controller.hidepassword.value,
                        icon: Icon(
                          controller.hidepassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.reAuthEmailandPassword();
                      },
                      child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}