import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_bottom_bar.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/product_meta_data.dart';
import 'package:uygunuburda/features/shop/screen/product_details/widgets/upper_container.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

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
              const SizedBox(height: AppSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
