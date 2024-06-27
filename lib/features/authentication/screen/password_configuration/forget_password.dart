import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/validators/validation.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            //heading
            Text(AppTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: AppSizes.spaceBtwItems,),
            Text(AppTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: AppSizes.spaceBtwSections*2,),

            //text field
            Form(
              key: controller.forgetpasswordkey,
              child: TextFormField(
                controller: controller.email,
                validator: AppValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections*2,),

            //submit button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.sendResetPasswordEmail(), child: const Text('Submit'))),

          ],
        ),
      ),
    );
  }
}