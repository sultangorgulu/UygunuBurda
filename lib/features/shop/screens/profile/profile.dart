import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screens/profile/widgets/profile_menu.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return  Scaffold (
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const AppCircularImage(image: AppImages.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Profil Resmini Değiştir')),

                  ],
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems/2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const AppSectionHeading(title: 'Profil Bilgileri', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

               AppProfileMenu(title: 'İsim', value: '...', onPressed: () {}),
               AppProfileMenu(title: 'Kullanıcı Adı', value: '...', onPressed: () {}),

               const AppSectionHeading(title: 'Kişisel Bilgiler', showActionButton: false),
               const SizedBox(height: AppSizes.spaceBtwItems),
               
               AppProfileMenu(title: 'E-mail', value: '...', onPressed: () {}),
               AppProfileMenu(title: 'Telefon Numarası', value: '...', onPressed: () {}),
               AppProfileMenu(title: 'Cinsiyet', value: '...', onPressed: () {}),
               AppProfileMenu(title: 'Doğum Tarihi', value: '...', onPressed: () {}),
               const Divider(),
               const SizedBox(height: AppSizes.spaceBtwItems),

               Center(
                child: TextButton(
                 onPressed: () {},
                 child: const Text('Hesabı Kapat', style: TextStyle(color: Colors.red)),
                ),
                ),
            ],
          ),
        ),
      ),
    ); 
  }
}