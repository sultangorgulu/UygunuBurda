import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/database/user_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/user_model.dart';
import 'package:uygunuburda/features/authentication/screen/verify_email/verify_email.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';
import 'package:uygunuburda/util/loaders/fullscreen_loader.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  final hidepassword = true.obs;
  final privacypolicy = false.obs;

    Future<void> signup() async {
    try {
    
      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        return;
      }

      if (!signupformkey.currentState!.validate()) {
        return;
      }

      if (!privacypolicy.value) {
        AppLoaders.warningSnackbar(
          title: 'Accept privacy Policy',
          message:
              'In order to create account, you must read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      final userCredential =
          await AuthenticationRepository.instance.signInWithEmailandPassword(
        email: email.text,
        password: password.text,
      );

      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        username: username.text.trim(),
        profilePicture: '',
      );

      final userRepositery = Get.put(UserCloud());
      await userRepositery.saveUserRecords(newUser);

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify your email to continue',
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      
    }
  }
}