import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/common/widgets/success_screen/success_screen.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerforAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerfication();
      AppLoaders.successSnackbar(
        title: 'Email Sent',
        message: 'Please Check your inbox and verify your email',
      );
    } catch (e) {
      
    }
  }

  setTimerforAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser!.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: AppImages.successRegister,
              subTitle: AppTexts.changeYourPasswordSubTitle,
              title: AppTexts.yourAccountCreatedTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatue() {
    final currentuser = FirebaseAuth.instance.currentUser;
    if (currentuser != null && currentuser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: AppImages.successRegister,
          subTitle: AppTexts.changeYourPasswordSubTitle,
          title: AppTexts.yourAccountCreatedTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}