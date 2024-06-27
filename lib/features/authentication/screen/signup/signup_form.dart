import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/authentication/controllers/signup/signup_controller.dart';
import 'package:uygunuburda/features/authentication/screen/signup/widgets/terms_conditions_checkbox.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/validators/validation.dart';

class AppSignupForm extends StatelessWidget {
  const AppSignupForm({super.key, });

  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signupformkey,
    
      child: Column (
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>  AppValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText:AppTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) =>  AppValidator.validateEmptyText('Last name', value),
                  controller: controller.lastname,
                  expands: false,
                  decoration: const InputDecoration(labelText: AppTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
                ),
            ],
          ),
    
          const SizedBox (height:AppSizes.spaceBtwInputFields),
    
          TextFormField(
            controller: controller.username,
            validator: (value) =>  AppValidator.validateEmptyText('Username', value),          
            expands: false,
            decoration: const InputDecoration(labelText: AppTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
    
         const SizedBox (height:AppSizes.spaceBtwInputFields),
    
         TextFormField(
          controller: controller.email,
            validator: (value) =>  AppValidator.validateEmail(value),  
            expands: false,
            decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.user_edit)),
          ),
    
         const SizedBox (height:AppSizes.spaceBtwInputFields),
    
         TextFormField(
          controller: controller.phonenumber,
          validator: (value) =>  AppValidator.validatePhoneNumber( value),
            expands: false,
            decoration: const InputDecoration(labelText: AppTexts.phoneNo, prefixIcon: Icon(Iconsax.user_edit)),
          ),
    
         const SizedBox (height:AppSizes.spaceBtwInputFields),
    
         TextFormField(
          controller: controller.password,
          validator: (value) =>  AppValidator.validatePassword(value),
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
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.signup() ,child: const Text(AppTexts.createAccount))),
        ],
        ),
      );
  }
}

