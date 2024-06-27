import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/features/authentication/models/controller/user_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  const AppHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AppAppBar(
      title: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
    Text(AppTexts.homeAppbarTitle, style: Theme.of(context). textTheme.labelMedium!.apply(color:AppColors.grey)),
    Obx(() {
            if(controller.profileLoading.value){
              //Display a shimmer loader while user profile is being loaded
              return const AppShimmerEffect(width:80,height:15);
            }else{
              print('user:${controller.user.value.id} auth:${FirebaseAuth.instance.currentUser?.uid}');
              return Text(controller.user.value.fullname,style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white),);
            }

          }),
        ],
      ),


    );
  }
}
