import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/authentication/screen/password_configuration/reset_password.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';


class ForgetPassword extends StatelessWidget{
  const ForgetPassword({super.key});


@override 
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(),
    body:  Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(AppTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Text(AppTexts.forgetPasswordSubTitle, style:Theme.of(context).textTheme.labelMedium),
          const SizedBox(height:AppSizes.spaceBtwSections * 2),

          TextFormField(
  decoration: const InputDecoration(labelText: AppTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
          ),
          const SizedBox(height:AppSizes.spaceBtwSections),

          SizedBox(width: double.infinity, child:ElevatedButton(onPressed: () => Get.off(() =>const ResetPassword()), child: const Text(AppTexts.submit)))

        ],
        ),
      ),
  );
}
}