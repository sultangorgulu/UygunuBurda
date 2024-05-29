import 'package:flutter/material.dart';
import 'package:uygunuburda/common/styles/spacing_styles.dart';
import 'package:uygunuburda/common/widgets/login_signup/form_divider.dart';
import 'package:uygunuburda/common/widgets/login_signup/social_buttons.dart';
import 'package:uygunuburda/features/authentication/screen/login/widgets/login_form.dart';
import 'package:uygunuburda/features/authentication/screen/login/widgets/login_header.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key}); // Use const for the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const AppLoginHeader(),

              const AppLoginForm(),

              AppFormDivider(
                dividerText: AppTexts.orSignInWith.toUpperCase(),
                ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              
              const AppSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
