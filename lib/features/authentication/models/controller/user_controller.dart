import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/database/user_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/user_model.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';
import 'package:uygunuburda/features/shop/screen/reauth_login/reauth_login.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';
import 'package:uygunuburda/util/loaders/fullscreen_loader.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final usercloud = UserCloud.instance;
  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final reAuthemail = TextEditingController();
  final reAuthpassword = TextEditingController();
  final hidepassword = false.obs;
  final imageuploading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      profileLoading.value = true;

      final user = await usercloud.fetchUserData();

      this.user(user);
      print(user.toJson());
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecordsfromGoogle(UserCredential? userCredential) async {
    try {
      await fetchUserData();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final userparts = UserModel.nameParts(
            userCredential.user?.displayName ?? '',
          );
          final username = UserModel.generateUsername(
            userCredential.user?.displayName ?? '',
          );

          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: userparts[0],
            lastName:
                userparts.length > 1 ? userparts.sublist(1).join(' ') : ' ',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          await usercloud.saveUserRecords(user);
        }
      }
    } catch (e) {
      AppLoaders.warningSnackbar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information, You can re-save your information in your profile',
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Account',
      middleText:
          'Are your sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
        'Processing',
        AppImages.dockeranimation,
      );

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteaccount();
          AppFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          AppFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginScreen());
        }
      }
    } catch (e) {
      AppFullScreenLoader.stopLoading();

      AppLoaders.warningSnackbar(
        title: 'Oh snap!',
        message: e.toString(),
      );
    }
  }

  Future<void> reAuthEmailandPassword() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Processing...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      AppFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageuploading.value = true;
        final imageurl =
            await usercloud.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageurl};
        await usercloud.updateSingleField(json);

        user.value.profilePicture = imageurl;

        AppLoaders.successSnackbar(
          title: 'Congratulations!',
          message: 'Your profile Image has been updated',
        );
      }
    } catch (e) {
      AppLoaders.errorSnackbar(
        title: 'Oh snap!',
        message: 'Something went wrong $e',
      );
    } finally {
      imageuploading.value = false;
    }
  }
}