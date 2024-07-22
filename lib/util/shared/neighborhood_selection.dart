import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/market_selection_screen.dart';

class NeighborhoodSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> neighborhoods = [
    {'id': 40, 'name': '100.Yıl Mahallesi'},
    {'id': 1, 'name': '17 Eylül Mahallesi'},
    // Add other neighborhoods here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Neighborhood'),
      ),
      body: ListView.builder(
        itemCount: neighborhoods.length,
        itemBuilder: (context, index) {
          final neighborhood = neighborhoods[index];
          return ListTile(
            title: Text(neighborhood['name']),
            onTap: () {
              Get.to(() => MarketSelectionScreen(neighborhoodId: neighborhood['id']));
            },
          );
        },
      ),
    );
  }
}
