import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/login_signup/form_divider.dart';
import 'package:uygunuburda/common/widgets/login_signup/social_buttons.dart';
import 'package:uygunuburda/features/authentication/screen/signup/signup_form.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: SingleChildScrollView(
      child: Padding (
        padding:const  EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSizes.spaceBtwSections),
            
            const AppSignupForm(),

            const SizedBox(height: AppSizes.spaceBtwSections),

            AppFormDivider(dividerText: AppTexts.orSignUpWith.capitalize!),
            
            const SizedBox(height: AppSizes.spaceBtwSections),

             const AppSocialButton(),
          ],
          ),
      ),
      ),
  );
}
}

