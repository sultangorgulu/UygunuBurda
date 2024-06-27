import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/rounded_image.dart';
import 'package:uygunuburda/common/widgets/shimmer.dart';
import 'package:uygunuburda/features/personalization/controllers/banner_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannercontroller = Get.put(BannnerController());

    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Obx(() {
        if (bannercontroller.isloading.value) {
          return const AppShimmerEffect(width: double.infinity, height: 190);
        }

        if (bannercontroller.allBanners.isEmpty) {
          return const Center(child: Text('No Data Found'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                items: bannercontroller.allBanners
                    .map((banner) => AppRoundedImage(
                          imageurl: banner.imageurl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetscreen),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      bannercontroller.updatepageindex(index),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < bannercontroller.allBanners.length; i++)
                      AppRoundedContainer(
                        height: 4,
                        width: 20,
                        backgroundcolor:
                            bannercontroller.currentpageIndex.value == i
                                ? AppColors.primary
                                : AppColors.grey,
                        radius: 20,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}