import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedImage = ''.obs;

  String getProductImages(Product product) {
    selectedImage.value = product.thumbnail;
    return product.thumbnail;
  }

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.defaultSpace,
                  vertical: AppSizes.defaultSpace * 2),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
