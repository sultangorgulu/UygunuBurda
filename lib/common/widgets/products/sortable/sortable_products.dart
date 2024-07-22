import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:uygunuburda/features/authentication/controllers/all_products_controller.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/shared/gridview.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProduct(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Popularity'
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
        Obx(
          () => AppGridView(
            itemcount: controller.products.length,
            itembuilder: (context, index) {
              return ProductCardVertical(
                product: controller.products[index],
              );
            },
          ),
        )
      ],
    );
  }
}
