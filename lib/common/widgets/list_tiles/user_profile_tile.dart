import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
class AppUserProfileTitle extends StatelessWidget {
  const AppUserProfileTitle({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return ListTile(
      leading:const AppCircularImage(
        image: AppImages.user,
        width: 80,
        height: 80,
        padding: 0,
      ),
      title: Text(controller.user.value.fullname,style:Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),),
      subtitle: Text(controller.user.value.email,style:Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white), ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit,color: AppColors.white,)),
      onTap: onPressed,

    );
  }
}