import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/features/authentication/screen/password_configuration/forget_password_success.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';
import 'package:uygunuburda/util/loaders/fullscreen_loader.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordkey = GlobalKey<FormState>();

  Future<void> sendResetPasswordEmail() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Logging you in...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!forgetpasswordkey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendResetPasswordEmail(
        email: email.text.trim(),
      );

      AppFullScreenLoader.stopLoading();
      AppLoaders.successSnackbar(
        title: 'Email Sent',
        message: 'Email Link sent to reset your password',
      );
      Get.to(() => ForgetPasswordSuccessScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      
    }
  }

  Future<void> resendResetPasswordEmail(String email) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Logging you in...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendResetPasswordEmail(
        email: email,
      );

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackbar(
        title: 'Email Sent',
        message: 'Email Link sent to reset your password',
      );
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      
    }
  }
}