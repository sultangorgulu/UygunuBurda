import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/personalization/controllers/favorite_controller.dart';
import 'package:uygunuburda/features/shop/screen/home/home.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/product_item.dart';
import 'package:uygunuburda/navigation_menu.dart';
import 'package:uygunuburda/util/animation/animation_loader.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/gridview.dart';
import 'package:uygunuburda/util/shared/shimmers/vertical_shimmer_effect.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());

    return SafeArea(
        child: Scaffold(
      appBar: AppAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const HomeScreen()),
            icon: const Icon(Iconsax.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.getFavoritedProducts(),
                builder: (context, snapshot) {
                  final emptywidget = AppAnimationLoader(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: AppImages.pensilanimation,
                    showAction: true,
                    actiontext: 'Let\'s add some',
                    onActionPressed: () =>
                        Get.off(() => const NavigationMenu()),
                  );

                  final widget = AppCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const AppVerticalShimmerEffect(itemCount: 6),
                    nothingFound: emptywidget,
                  );

                  if (widget != null) return widget;

                  return AppGridView(
                    itemcount: snapshot.data!.length,
                    itembuilder: (context, index) {
                      return ProductCardVertical(
                        product: snapshot.data![index],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    ));
  }
}