import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const AppShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullname,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AppColors.white));
            }
          }),
        ],
      ),
    );
  }
}