import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/change_name.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/change_username.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/user_profile_tile.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/section_title.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const AppAppBar(
        title: Text('Profile'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkimage = controller.user.value.profilePicture;
                    final image =
                        networkimage.isNotEmpty ? networkimage : AppImages.user;

                    if (controller.imageuploading.value) {
                      return const AppShimmerEffect(
                          width: 80, height: 80, radius: 80);
                    } else {
                      return AppRoundedImage(
                        imageurl: image,
                        roundedborder: true,
                        borderradius: 50,
                        isNetworkImage: networkimage.isNotEmpty,
                        width: 150,
                        height: 150,
                        boxFit: BoxFit.cover,
                      );
                    }
                  }),
                  TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: const Text('Change profile picture'),
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionTitle(
                    title: 'Profile Information',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'Name',
                    midtitle: controller.user.value.fullname,
                    onPressed: () => Get.to(() => const ChangeNameScreen()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  UserProfileTile(
                    title: 'Username',
                    midtitle: controller.user.value.username,
                    onPressed: () => Get.to(() => const ChangeUserNameScreen()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const AppSectionTitle(
                    title: 'Personal Information',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'User ID',
                    midtitle: controller.user.value.id,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'E-mail',
                    midtitle: controller.user.value.email,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'Phone Number',
                    midtitle: controller.user.value.phoneNumber,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const UserProfileTile(title: 'Gender', midtitle: 'male'),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const UserProfileTile(
                      title: 'Date of Birth', midtitle: '1 oct,2000'),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  const Divider(),
                  TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close account',
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}