import 'package:flutter/material.dart';
import 'package:uygunuburda/features/authentication/models/model/featured_brands.dart';
import 'package:uygunuburda/util/shared/location_bar.dart';

class MarketSelectionScreen extends StatefulWidget {
  @override
  _MarketSelectionScreenState createState() => _MarketSelectionScreenState();
}

class _MarketSelectionScreenState extends State<MarketSelectionScreen> {
  String? _selectedCity;
  String? _selectedDistrict;
  int? _selectedNeighborhoodId;

  List<Map<String, dynamic>> _districts = [];
  List<Map<String, dynamic>> _neighborhoods = [];
  List<Map<String, dynamic>> _filteredMarkets = [];

  final List<Map<String, dynamic>> cities = [
    {
      'name': 'Balıkesir',
      'districts': [
        {
          'name': 'Bandırma',
          'neighborhoods': [
            {'id': 40, 'name': '100.Yıl Mahallesi'},
            {'id': 1, 'name': '17 Eylül Mahallesi'},
            {'id': 41, 'name': '600 Evler Mahallesi'},
            {'id': 28, 'name': 'Akçapınar Mahallesi'},
            {'id': 20, 'name': 'Aksakal Mahallesi'},
            {'id': 15, 'name': 'Ayyıldız Mahallesi'},
            {'id': 13, 'name': 'Bentbaşı Mahallesi'},
            {'id': 24, 'name': 'Bereketli Mahallesi'},
            {'id': 43, 'name': 'Beyköy Mahallesi'},
            {'id': 33, 'name': 'Bezirci Mahallesi'},
            {'id': 31, 'name': 'Çalışkanlar Mahallesi'},
            {'id': 48, 'name': 'Çarıkköy Mahallesi'},
            {'id': 37, 'name': 'Çepni Mahallesi'},
            {'id': 8, 'name': 'Çınarlı Mahallesi'},
            {'id': 42, 'name': 'Çinge Mahallesi'},
            {'id': 18, 'name': 'Dere Mahallesi'},
            {'id': 32, 'name': 'Doğanpınar Mahallesi'},
            {'id': 21, 'name': 'Doğruca Mahallesi'},
            {'id': 44, 'name': 'Dutliman Mahallesi'},
            {'id': 10, 'name': 'Edincik Mahallesi'},
            {'id': 38, 'name': 'Emre Mahallesi'},
            {'id': 30, 'name': 'Ergili Mahallesi'},
            {'id': 26, 'name': 'Erikli Mahallesi'},
            {'id': 39, 'name': 'Eskiziraatli Mahallesi'},
            {'id': 34, 'name': 'Gölyaka Mahallesi'},
            {'id': 17, 'name': 'Günaydın Mahallesi'},
            {'id': 6, 'name': 'Hacı Yusuf Mahallesi'},
            {'id': 19, 'name': 'Haydar Çavuş Mahallesi'},
            {'id': 45, 'name': 'Hıdırköy Mahallesi'},
            {'id': 2, 'name': 'İhsaniye Mahallesi'},
            {'id': 11, 'name': 'Kayacık Mahallesi'},
            {'id': 46, 'name': 'Kirazlı Mahallesi'},
            {'id': 25, 'name': 'Kuşcenneti Mahallesi'},
            {'id': 29, 'name': 'Külefli Mahallesi'},
            {'id': 9, 'name': 'Levent Mahallesi'},
            {'id': 47, 'name': 'Mahbubeler Mahallesi'},
            {'id': 36, 'name': 'Orhaniye Mahallesi'},
            {'id': 12, 'name': 'Ömerli Mahallesi'},
            {'id': 3, 'name': 'Paşabayır Mahallesi'},
            {'id': 7, 'name': 'Paşakent Mahallesi'},
            {'id': 5, 'name': 'Paşakonak Mahallesi'},
            {'id': 16, 'name': 'Paşamescit Mahallesi'},
            {'id': 4, 'name': 'Sunullah Mahallesi'},
            {'id': 14, 'name': 'Yeni Mahallesi'},
            {'id': 23, 'name': 'Yenice Mahallesi'},
            {'id': 35, 'name': 'Yenisığırcı Mahallesi'},
            {'id': 22, 'name': 'Yeniyenice Mahallesi'},
            {'id': 49, 'name': 'Yeniziraatli Mahallesi'},
            {'id': 27, 'name': 'Yeşilçomlu Mahallesi'},
          ],
        },
        // Diğer ilçeler...
      ],
    },
    // Diğer şehirler...
  ];

  final List<Map<String, dynamic>> markets = [
    {'id': 1, 'name': 'Migros', 'neighborhoodIds': [1, 41, 20, 10, 16, 4, 11, 9, 7, 3, 2, 15, 40, 13, 6, 18]},
    {'id': 2, 'name': 'Bim', 'neighborhoodIds': [3, 1, 5, 6, 4]},
    {'id': 3, 'name': 'A101', 'neighborhoodIds': [41, 1, 11, 3, 4, 18, 13, 7, 6, 40, 2, 9, 5, 23, 8]},
    {'id': 4, 'name': 'Şok', 'neighborhoodIds': [19, 17, 4, 7, 5, 2]},
    {'id': 5, 'name': 'Eğit-Koop', 'neighborhoodIds': [19, 7]},
    {'id': 6, 'name': 'Carrefour', 'neighborhoodIds': [41, 3, 2, 6, 8, 1, 40, 4, 14]},
  ];

  void _onNeighborhoodSelected(int neighborhoodId) {
    setState(() {
      _selectedNeighborhoodId = neighborhoodId;
      _filteredMarkets = markets
          .where((market) => market['neighborhoodIds'].contains(neighborhoodId))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Listesi'),
      ),
      body: Column(
        children: <Widget>[
          LocationSearchBar(
            showBackground: true,
            showBorder: true,
            onNeighborhoodSelected: _onNeighborhoodSelected,
          ),

          // Market Listesi
          if (_selectedNeighborhoodId != null)
            _filteredMarkets.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _filteredMarkets.length,
                      itemBuilder: (context, index) {
                        final market = _filteredMarkets[index];
                        return ListTile(
                          title: Text(market['name']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeaturedBrands(markets: _filteredMarkets),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Bu mahallede market bulunamadı.",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
        ],
      ),
    );
  }
}
