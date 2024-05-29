import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';

class AppUserProfileTile extends StatelessWidget {
  const AppUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppCircularImage( image: AppImages.user, width: 50, height: 50, padding: 0),
      title: Text('user', style: Theme.of(context). textTheme.headlineSmall!.apply(color:AppColors.white)),
      subtitle: Text('user@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white)),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit, color:AppColors.white)),
    );
  }
}