import 'package:get/get.dart';
import 'package:uygunuburda/database/user_cloud.dart';
import 'package:uygunuburda/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:uygunuburda/features/authentication/controllers/signup/signup_controller.dart';
import 'package:uygunuburda/features/authentication/models/controller/address_controller.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/features/authentication/screen/login/controller/login_controller.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserCloud());
    Get.put(NetworkManager());
    Get.put(SignUpController());
    Get.put(UserController());
    Get.put(LoginController());
    Get.put(ForgetPasswordController());
    Get.put(AddressController());
  }
}