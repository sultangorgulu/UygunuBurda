import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/brands/brand_card.dart';
import 'package:uygunuburda/common/widgets/layouts/grid_layout.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screen/brand/brand_products.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: Text('Mağazalar'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const AppSectionHeading(title: 'Mağazalar'),
              const SizedBox(height: AppSizes.spaceBtwItems),

              AppGridLayout(
                itemCount: 10, 
                mainAxisExtent: 80, 
                itemBuilder: (context, index) => AppBrandCard(
                  showBorder: true, 
                  onTap: () => Get.to(() => const BrandProducts()
                  ),
                  ),
                  ),
            ],
            )
          ),
      ),
    );
  }
}