import 'package:flutter/material.dart';

class FeaturedBrands extends StatelessWidget {
  final List<Map<String, dynamic>> markets;

  FeaturedBrands({required this.markets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Brands'),
      ),
      body: ListView.builder(
        itemCount: markets.length,
        itemBuilder: (context, index) {
          final market = markets[index];
          return ListTile(
            title: Text(market['name']),
          );
        },
      ),
    );
  }
}
