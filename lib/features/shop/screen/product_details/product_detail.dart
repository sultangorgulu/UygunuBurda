// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_bottom_bar.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_meta_data.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/upper_container.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/section_title.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ProductBottomBar(product: product),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UpperContainer(product: product),
              AppProductMetaData(product: product),
                SizedBox(height: AppSizes.spaceBtwItems),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Checkout'),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    AppSectionTitle(
                      title: 'Description',
                      showactionbutton: false,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    Divider(),
                    
                    SizedBox(height: AppSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}