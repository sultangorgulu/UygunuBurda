import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uygunuburda/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screens/profile/profile.dart';
import 'package:uygunuburda/features/shop/screens/settings/settings_menu_tile.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, });

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
                      'Hesap',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),
                  AppUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())), 
                  const SizedBox(height: AppSizes.spaceBtwSections), 
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionHeading(
                    title: 'Hesap Ayarları',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const AppSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Adreslerim',
                    subTitle: 'Adresinizi seçin',
                  ),
                  const AppSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Bildiirm mesajları',
                  ),
                  const AppSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Hesap Güvenliği',
                    subTitle: 'Hesabınızı Yönetin',
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const AppSectionHeading(
                    title: 'Uygulama Ayarları',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const AppSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Veriler Yükleniyor',
                    subTitle: 'Verileri Yükle',
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Konum',
                    subTitle: 'Konumunu seç',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe mode',
                    subTitle: 'Search result',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'Image',
                    subTitle: 'image',
                    trailing: Switch(value: false, onChanged: (value) {}),
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
