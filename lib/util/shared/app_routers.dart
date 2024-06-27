import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/screen/onboarding/onboarding.dart';
import 'package:uygunuburda/features/authentication/screen/password_configuration/forget_password.dart';
import 'package:uygunuburda/features/authentication/screen/signup/widgets/signup.dart';
import 'package:uygunuburda/features/authentication/screen/verify_email/verify_email.dart';
import 'package:uygunuburda/features/shop/screen/address/address.dart';
import 'package:uygunuburda/features/shop/screen/home/home.dart';
import 'package:uygunuburda/features/shop/screen/login/login.dart';
import 'package:uygunuburda/features/shop/screen/profile/profile.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/user_profile.dart';
import 'package:uygunuburda/features/shop/screen/store/store.dart';
import 'package:uygunuburda/features/shop/screen/wishlist/wishlist.dart';
import 'package:uygunuburda/util/shared/routers.dart';

class AppAppRoutes {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.store, page: () => const StoreScreen()),
    GetPage(name: AppRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: AppRoutes.settings, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.userProfile, page: () => const UserProfile()),
    GetPage(name: AppRoutes.userAddress, page: () => const AddressView()),
    GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: AppRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: AppRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.forgetpassword, page: () => const ForgetPassword()),
    GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}