import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uygunuburda/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screen/address/address.dart';
import 'package:uygunuburda/features/shop/screen/profile/profile.dart';
import 'package:uygunuburda/features/shop/screen/settings/settings_menu_tile.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //header
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  AppAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),
                  //const SizedBox(height: TSizes.spaceBtwSections,),
                  //user profile card
                  AppUserProfileTitle(onPressed:() => Get.to(() => const ProfileScreen()) ),
                  const SizedBox(height: AppSizes.spaceBtwSections,),
                ],
              ),
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Account settings
                  const AppSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const AddressView()),
                  ),

                  AppSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification messages',
                    onTap: () {},
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected',
                    onTap: () {},
                  ),

                  //APP Settings
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  const AppSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  const AppSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase'),

                  AppSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocations',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search results is safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: (){
                        AuthenticationRepository.instance.logout();
                        }
                        , child: const Text('Logout')
                        ,),

                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections*2.5,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}