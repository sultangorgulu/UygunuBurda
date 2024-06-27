import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/features/authentication/models/controller/update_name_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameController());
    return Scaffold(
      //custom Appbar
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            ///heading
            Text('Use real name for easy verification.This name will appear on several pages.',style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: AppSizes.spaceBtwSections,),
            ///Text field and button
            Form(
              key: controller.updateUsernamekey,
                child:Column(
                  children: [
                   TextFormField(
                     controller: controller.firstname,
                     validator: (value)=>AppValidator.validateEmptyText('First name', value),
                     expands: false,
                     decoration: const InputDecoration(labelText: AppTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                   ) ,
                    const SizedBox(height: AppSizes.spaceBtwInputFields,),
                    TextFormField(
                      controller: controller.lastname,
                      validator: (value)=>AppValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: AppTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections,),
            
            ///save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=>controller.updateUserName(),child: const Text('Save'),),
            )
          ],
        ),
      ),
    );
  }
}