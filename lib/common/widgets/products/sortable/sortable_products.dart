import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/layouts/grid_layout.dart';
import 'package:uygunuburda/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppSortableProducts extends StatelessWidget {
  const AppSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
           onChanged: (value) {},
          items:['İsim', 'Yüksek Fiyat', 'Düşük Fiyat', 'İndirim', 'En Yeniler', 'En Popüler']
          .map((option) => DropdownMenuItem(value: option, child: Text(option)))
          .toList(),
         ),
         const SizedBox(height: AppSizes.spaceBtwSections),
    
         AppGridLayout(itemCount: 8, itemBuilder: (_, index) => const AppProductCardVertical())
      ]
    );
  }
}