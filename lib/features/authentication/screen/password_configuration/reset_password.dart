import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(image:  const AssetImage(AppImages.deliveredEmailIllustration),width: AppHelperFunctions.screenWidth()*60,),
              const SizedBox(height: AppSizes.spaceBtwSections,),

              //title and subtitle
              Text(AppTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwSections,),
              Text(AppTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: AppSizes.spaceBtwSections,),

              //buttons
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed:()=>Get.offAll(()=>const LoginScreen()),child: const Text('Done'),),),
              const SizedBox(height: AppSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,child: TextButton(onPressed:()=>ForgetPasswordController.instance.resendResetPasswordEmail(email),child: const Text(AppTexts.resendEmail),),),
              const SizedBox(height: AppSizes.spaceBtwItems,),



            ],
          ),
        ),
      ),
    );
  }
}