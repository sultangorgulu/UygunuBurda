import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/personalization/controllers/location_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/device/device_utility.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({
    Key? key,
    required this.showBackground,
    required this.showBorder,
    required this.onNeighborhoodSelected,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  }) : super(key: key);

  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final void Function(int neighborhoodId) onNeighborhoodSelected;

  @override
  _LocationSearchBarState createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  String? selectedCity;
  String? selectedDistrict;
  String? selectedNeighborhood;

  late TextEditingController cityController;
  late TextEditingController districtController;
  late TextEditingController neighborhoodController;

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

  @override
  void initState() {
    super.initState();
    cityController = TextEditingController();
    districtController = TextEditingController();
    neighborhoodController = TextEditingController();
  }

  @override
  void dispose() {
    cityController.dispose();
    districtController.dispose();
    neighborhoodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: widget.padding,
      child: Container(
        width: AppDeviceUtils.getScreenWidth(context),
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
        decoration: BoxDecoration(
          color: widget.showBackground
              ? isDark
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
          borderRadius: widget.showBorder
              ? BorderRadius.circular(AppSizes.cardRadiusLg)
              : null,
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showCityPicker(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedCity ?? "Şehir",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showDistrictPicker(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedDistrict ?? "İlçe",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showNeighborhoodPicker(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedNeighborhood ?? "Mahalle",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCityPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              return ListTile(
                title: Text(city['name']),
                onTap: () {
                  setState(() {
                    selectedCity = city['name'];
                    selectedDistrict = null;
                    selectedNeighborhood = null;
                    cityController.text = city['name'];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showDistrictPicker(BuildContext context) {
    if (selectedCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lütfen önce bir şehir seçin."),
        ),
      );
      return;
    }

    final selectedCityData = cities.firstWhere((city) => city['name'] == selectedCity);
    final List<Map<String, dynamic>> districts = selectedCityData['districts'];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: districts.length,
            itemBuilder: (context, index) {
              final district = districts[index];
              return ListTile(
                title: Text(district['name']),
                onTap: () {
                  setState(() {
                    selectedDistrict = district['name'];
                    selectedNeighborhood = null;
                    districtController.text = district['name'];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showNeighborhoodPicker(BuildContext context) {
    if (selectedDistrict == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lütfen önce bir ilçe seçin."),
        ),
      );
      return;
    }

    final selectedCityData = cities.firstWhere((city) => city['name'] == selectedCity);
    final selectedDistrictData = selectedCityData['districts'].firstWhere((district) => district['name'] == selectedDistrict);
    final List<Map<String, dynamic>> neighborhoods = selectedDistrictData['neighborhoods'];

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: neighborhoods.length,
            itemBuilder: (context, index) {
              final neighborhood = neighborhoods[index];
              return ListTile(
                title: Text(neighborhood['name']),
                onTap: () {
                  setState(() {
                    selectedNeighborhood = neighborhood['name'];
                    neighborhoodController.text = neighborhood['name'];
                  });
                  widget.onNeighborhoodSelected(neighborhood['id']);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
