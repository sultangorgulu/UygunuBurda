import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/products/sortable/sortable_products.dart';
import 'package:uygunuburda/features/authentication/controllers/all_products_controller.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';
import 'package:uygunuburda/util/shared/shimmers/vertical_shimmer_effect.dart';

class ViewAllProductsScreen extends StatelessWidget {
  const ViewAllProductsScreen({
    super.key,
    required this.title,
    this.query,
    this.futuremethod,
  });

  final String title;
  final Query? query;
  final Future<List<Product>>? futuremethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: AppAppBar(
        title: Text(title),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: FutureBuilder(
              future: futuremethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                final widget = AppCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: const AppVerticalShimmerEffect(),
                );

                if (widget != null) return widget;

                final products = snapshot.data;

                return SortableProducts(products: products!);
              }),
        ),
      ),
    );
  }
}