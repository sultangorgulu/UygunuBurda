//9.video

import 'package:flutter/material.dart';
import 'package:uygunuburda/common/styles/spacing_styles.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image,title,subTitle;
  final VoidCallback onPressed;

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding:AppSpacingStyle.paddingWithAppBarHeight * 2 ,
        child: Column(
          children: [

           //Image(image: AssetImage(image), width: AppHelperFunctions.screenWidth() * 0.6),
           const SizedBox(height:AppSizes.spaceBtwItems),

           Text(title,
              style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
           
           const SizedBox(height: AppSizes.spaceBtwItems),
           Text(subTitle,
              style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
             
             const SizedBox(height:AppSizes.spaceBtwSections),


             SizedBox(
              width:double.infinity,
              child:ElevatedButton(onPressed: onPressed, child: const Text(AppTexts.appContinue)),
             )
          ],
          )
        ),
    ),
  );
}
}