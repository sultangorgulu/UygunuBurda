import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/database/user_cloud.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/navigation_menu.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';
import 'package:uygunuburda/util/loaders/fullscreen_loader.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> updatenamekey = GlobalKey<FormState>();
  GlobalKey<FormState> updateUsernamekey = GlobalKey<FormState>();
  final usercontroller = UserController.instance;
  final usercloud = UserCloud.instance;

  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  Future<void> initializeNames() async {
    firstname.text = usercontroller.user.value.firstName;
    lastname.text = usercontroller.user.value.lastName;
    username.text = usercontroller.user.value.username;
  }

  Future<void> updateUserName() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'We are updating your information...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!updatenamekey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstname.text.trim(),
        'LastName': lastname.text.trim(),
      };

      await usercloud.updateSingleField(name);

      usercontroller.user.value.firstName = firstname.text.trim();
      usercontroller.user.value.lastName = lastname.text.trim();

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your Name has been updated',
      );

      Get.off(() => const NavigationMenu());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> updateUserusername() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'We are updating your information...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUsernamekey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> usernamee = {
        'Username': username.text.trim(),
      };

      await usercloud.updateSingleField(usernamee);

      usercontroller.user.value.username = username.text.trim();

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your username has been updated',
      );

      Get.off(() => const NavigationMenu());
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}