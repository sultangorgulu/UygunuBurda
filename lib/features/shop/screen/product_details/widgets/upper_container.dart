import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/features/personalization/controllers/image_controller.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/favorite_icon.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getProductImages(product);
    return AppPrimaryHeaderContainer(
      child: Container(
        color: dark ? AppColors.dark : AppColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: Center(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller
                          .showEnlargedImage(controller.selectedImage.value),
                      child: CachedNetworkImage(
                          imageUrl: controller.selectedImage.value),
                    ),
                  ),
                ),
              ),
            ),
            AppAppBar(
              showbackarrow: true,
              actions: [FavoriteIcon(productId: product.id)],
            )
          ],
        ),
      ),
    );
  }
}
