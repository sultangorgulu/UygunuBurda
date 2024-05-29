import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/brands/brand_card.dart';
import 'package:uygunuburda/common/widgets/products/sortable/sortable_products.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts ({super.key});

  @override 
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar (title: Text('A101')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [

              AppBrandCard(showBorder: true),
              SizedBox(height: AppSizes.spaceBtwSections),

              AppSortableProducts(),

            ],
            ),
        )
      )
      );
  }
}