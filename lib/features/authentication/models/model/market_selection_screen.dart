import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/features/authentication/models/model/market_container.dart';
import 'package:uygunuburda/features/shop/screen/brand/brand_products.dart';
import 'package:uygunuburda/util/constants/sizes.dart'; // Ensure this path is correct
import 'package:uygunuburda/util/shared/gridview.dart';

class MarketSelectionScreen extends StatelessWidget {
  final int neighborhoodId;

  const MarketSelectionScreen({Key? key, required this.neighborhoodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> marketData = [
      {'id': 1, 'name': 'Migros', 'neighborhoodIds': [1,
2,
3,
4,
6,
7,
9,
10,
11,
13,
15,
16,
18,
20,
40,
41]},
      {'id': 2, 'name': 'Bim', 'neighborhoodIds': [1,
3,
4,
5,
6]},
      {'id': 3, 'name': 'A101', 'neighborhoodIds': [1,
2,
3,
4,
5,
6,
7,
8,
9,
11,
13,
18,
23,
40,
41]},
      {'id': 4, 'name': 'Şok', 'neighborhoodIds': [2,
4,
5,
7,
17,
19]},
      {'id': 5, 'name': 'Eğit-Koop', 'neighborhoodIds': [7,
19]},
      {'id': 6, 'name': 'Carrefour', 'neighborhoodIds': [1,
2,
3,
4,
6,
8,
14,
40,
41]},
    ];

    final Map<String, String> marketLogos = {
      'Migros': 'https://firebasestorage.googleapis.com/v0/b/uygunuburda-81794.appspot.com/o/store_logos%2Fmigros.png?alt=media&token=4efa74b2-3f04-48f9-a365-4ca6c3584624',
      'A101': 'https://firebasestorage.googleapis.com/v0/b/uygunuburda-81794.appspot.com/o/store_logos%2Fa101.png?alt=media&token=eca9e71a-17be-4721-96a9-464e846ed5d9',
      'Bim': 'https://firebasestorage.googleapis.com/v0/b/uygunuburda-81794.appspot.com/o/store_logos%2Fbim.jpg?alt=media&token=1fdc3549-7c23-449f-a771-b1f8794d3cdc',
      'Carrefour': 'https://firebasestorage.googleapis.com/v0/b/uygunuburda-81794.appspot.com/o/store_logos%2Fcarrefour.jpg?alt=media&token=31689fb8-0642-4699-9d86-179eb188acbb',
      'Şok': 'https://firebasestorage.googleapis.com/v0/b/uygunuburda-81794.appspot.com/o/store_logos%2Fsok.jpg?alt=media&token=c0b0c55f-6fd5-41b4-86fc-b7aa2d9576dc',
    };

    final filteredMarkets = marketData.where((market) => market['neighborhoodIds'].contains(neighborhoodId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Marketler'),
      ),
      body: AppGridView(
        itemcount: filteredMarkets.length,
        mainaxisextent: 120, // Ensure this value matches your design
        itembuilder: (context, index) {
          final market = filteredMarkets[index]; // Renamed variable to 'market'
          final logoUrl = marketLogos[market['name']] ?? '';

          return MarketContainer(
            marketName: market['name'],
            logoUrl: logoUrl,
            onPressed: () {
              final brand = BrandModel(
                id: market['id'].toString(), // Ensure the id is a string
                name: market['name'],
                image: logoUrl, // Provide the logo URL as the image parameter
              );

              Get.to(() => BrandProducts(brand: brand));
            },
          );
        },
      ),
    );
  }
}
