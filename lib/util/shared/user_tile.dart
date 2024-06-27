import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/features/shop/screen/profile/widgets/user_profile.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';

class AppUserTile extends StatelessWidget {
  const AppUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const AppRoundedImage(
        imageurl: AppImages.user,
        padding: EdgeInsets.zero,
        height: 50,
        width: 50,
        roundedborder: true,
        borderradius: 50,
      ),
      title: Obx(
        () => Text(
          controller.user.value.fullname,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: AppColors.white),
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .apply(color: AppColors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            Get.to(() => const UserProfile());
          },
          icon: const Icon(
            Iconsax.edit,
            color: AppColors.white,
          )),
    );
  }
}