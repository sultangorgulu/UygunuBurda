import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/controllers/signup/signup_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppTermsAndConditionCheckBox extends StatelessWidget {
  const AppTermsAndConditionCheckBox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);

    return Row(
     children: [
       SizedBox(width: 24, height:24, child:Obx(
        () => Checkbox(
          value:controller.privacypolicy.value, 
          onChanged: (value) => controller.privacypolicy.value),
          )),
       const SizedBox(width: AppSizes.spaceBtwItems),
       Text.rich(
         TextSpan(children:[
           TextSpan(text:'${AppTexts.iAgreeTo}', style: Theme.of(context).textTheme.bodySmall),
           TextSpan(text: AppTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
             color: dark ? AppColors.white : AppColors.primary,
             decoration: TextDecoration.underline,
             decorationColor:  dark ? AppColors.white: AppColors.primary,
             )),
             TextSpan(text:'${AppTexts.and}', style: Theme.of(context).textTheme.bodySmall),
             TextSpan(text: AppTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
             color: dark ? AppColors.white: AppColors.primary,
             decoration: TextDecoration.underline,
             decorationColor: dark ? AppColors.white: AppColors.primary,
             )),
         ] ),
       ),
        
     ],
     );
  }
}