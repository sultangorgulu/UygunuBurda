import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/features/authentication/models/controller/update_name_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/validators/validation.dart';

class ChangeUserNameScreen extends StatelessWidget {
  const ChangeUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          'Change Username',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Make your unique username',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Form(
                key: controller.updateUsernamekey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.username,
                      validator: (value) =>
                          AppValidator.validateEmptyText('Username', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: AppTexts.username,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.updateUserusername();
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}