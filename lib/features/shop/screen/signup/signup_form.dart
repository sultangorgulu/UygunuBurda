import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/authentication/screen/signup/widgets/terms_conditions_checkbox.dart';
import 'package:uygunuburda/features/authentication/screen/verify_email/verify_email.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class AppSignupForm extends StatelessWidget {
  const AppSignupForm({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {

    return Form(
    
      child: Column (
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText:AppTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: AppTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
                ),
            ],
          ),
    
          const SizedBox (height:AppSizes.spaceBtwInputFields),
    
          TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: AppTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
    
         const SizedBox (height:AppSizes.spaceBtwInputFields),
    
         TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.user_edit)),
          ),
    
         const SizedBox (height:AppSizes.spaceBtwInputFields),
    
         TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: AppTexts.phoneNo, prefixIcon: Icon(Iconsax.user_edit)),
          ),
    
         const SizedBox (height:AppSizes.spaceBtwInputFields),
    
         TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: AppTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
         ),
         const SizedBox(height: AppSizes.spaceBtwSections),
    
         const AppTermsAndConditionCheckBox(),
         
        const SizedBox(height: AppSizes.spaceBtwSections),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(()=> const VerifyEmailScreen()),child: const Text(AppTexts.createAccount))),
        ],
        ),
      );
  }
}

