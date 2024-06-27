import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/success_screen/success_screen.dart';
import 'package:uygunuburda/features/authentication/screen/verify_email/verify_email_controller.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  
  final String? email;

  @override

  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //Image(image: const AssetImage() width: AppHleperFunctions.screenWidth()* 0.6,),
              const SizedBox(height:AppSizes.spaceBtwSections),
              
              Text (AppTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign:TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text('destek@gmail.com', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(AppTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity, 
                child:ElevatedButton(
                onPressed: () => Get.to(() =>  SuccessScreen(
                  image: AppImages.darkAppLogo,
                  title: AppTexts.yourAccountCreatedTitle,
                  subTitle: AppTexts.yourAccountCreatedSubTitle,
                  onPressed: () => Get.to(() => const LoginScreen()),
                )), child: const Text(AppTexts.appContinue))),
                const SizedBox(height: AppSizes.spaceBtwItems),
                SizedBox(width: double.infinity, child: TextButton(onPressed: () {} , child: const Text(AppTexts.resendEmail)))


            ],
          ),
          ),
      ),

      );
  }
}