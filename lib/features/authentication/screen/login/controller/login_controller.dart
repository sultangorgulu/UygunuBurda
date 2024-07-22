import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';
import 'package:uygunuburda/util/loaders/fullscreen_loader.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  final localstorage = GetStorage();
  final rememberme = false.obs;
  final hidepassword = false.obs;
  final usercontroller = UserController.instance;

  @override
  void onInit() {
    email.text = localstorage.read('RememberMe_Email') ?? '';
    password.text = localstorage.read('RememberMe_Password') ?? '';
    super.onInit();
  }

  Future<void> emailandPasswordSignIn() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Logging you in...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!loginformkey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (rememberme.value) {
        localstorage.write('RememberMe_Email', email.text.trim());
        localstorage.write('RememberMe_Password', password.text.trim());
      }

      await AuthenticationRepository.instance.signInWithEmailandPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      AppFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      
    }
  }

  Future<void> GoogleSignIn() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Logging you in...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      await usercontroller.saveUserRecordsfromGoogle(userCredential);

      AppFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      
    }
  }
}