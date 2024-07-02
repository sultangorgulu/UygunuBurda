import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uygunuburda/features/shop/screen/address/address.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/load_data.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/profile_tile.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/section_title.dart';
import 'package:uygunuburda/util/shared/user_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  AppAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),
                  const AppUserTile(),
                  const SizedBox(height: AppSizes.defaultSpace)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionTitle(
                    title: 'Account Settings',
                    showactionbutton: false,
                  ),
                  ProfileTile(
                    leading: const Icon(
                      Iconsax.safe_home,
                      color: AppColors.primary,
                    ),
                    title: 'My Addresses',
                    subtitle: 'Set Shopping delivery address',
                    onTap: () => Get.to(() => const AddressView()),
                  ),
                  const ProfileTile(
                      leading: Icon(
                        Iconsax.notification,
                        color: AppColors.primary,
                      ),
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message'),
                  const ProfileTile(
                      leading: Icon(
                        Iconsax.security_card,
                        color: AppColors.primary,
                      ),
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const AppSectionTitle(
                    title: 'App Settings',
                    showactionbutton: false,
                  ),
                  ProfileTile(
                    leading: const Icon(
                      Iconsax.document_upload,
                      color: AppColors.primary,
                    ),
                    title: 'Load data',
                    subtitle: 'Upload data to your Cloud Firebase',
                    onTap: () => Get.to(() => const LoadDataScreen()),
                  ),
                  ProfileTile(
                    leading: const Icon(
                      Iconsax.location,
                      color: AppColors.primary,
                    ),
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ProfileTile(
                    leading: const Icon(
                      Iconsax.security_user,
                      color: AppColors.primary,
                    ),
                    title: 'Safe Mode',
                    subtitle: 'Search results is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ProfileTile(
                    leading: const Icon(
                      Iconsax.image,
                      color: AppColors.primary,
                    ),
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () async {
                            await AuthenticationRepository.instance.logout();
                          },
                          child: Text(
                            'Log out',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}