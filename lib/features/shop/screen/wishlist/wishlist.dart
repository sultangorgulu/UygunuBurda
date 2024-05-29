import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/icons/circular_icons.dart';
import 'package:uygunuburda/common/widgets/layouts/grid_layout.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:uygunuburda/features/shop/screen/home/home.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen ({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: Text('Beğendiğiniz Ürünler', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          AppCircularIcon( icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              AppGridLayout(itemCount: 4, itemBuilder: (_, index) => const AppProductCardVertical())
            ],
            ),
          ),
      )
    );
  }
}