import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/appbar/appbar.dart';
import 'package:uygunuburda/common/widgets/products/sortable/sortable_products.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AllProducts extends StatelessWidget{
  const AllProducts({super.key});

  @override 
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: AppAppBar(title: Text('Popüler Ürünler'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: AppSortableProducts()
          ),
      ),

    );
  }
}

