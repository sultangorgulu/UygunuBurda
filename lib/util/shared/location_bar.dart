import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/personalization/controllers/location_controller.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/device/device_utility.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({
    super.key,
    required this.showBackground,
    required this.showBorder,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  _LocationSearchBarState createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  String? selectedCity;
  String? selectedDistrict;
  String? selectedNeighborhood;

  // Location verilerini çekmek için controller
  final locationController = Get.find<LocationController>();

  // PopUp için controller
  late TextEditingController cityController;
  late TextEditingController districtController;
  late TextEditingController neighborhoodController;

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
                      Text(selectedCity ?? "Şehir"),
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
                      Text(selectedDistrict ?? "İlçe"),
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
                          style: const TextStyle(
                            fontSize: 14,
                          ),
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

  // Şehir seçim popUp'ı
  void _showCityPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Obx(() => Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: locationController.allLocations
                .where((location) => location.district == null)
                .map((city) => ListTile(
                      title: Text(city.city),
                      onTap: () {
                        setState(() {
                          selectedCity = city.city;
                          selectedDistrict = null;
                          selectedNeighborhood = null;
                          cityController.text = city.city;
                        });
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        ));
      },
    );
  }

  // İlçe seçim popUp'ı
  void _showDistrictPicker(BuildContext context) {
    if (selectedCity == null) {
      // Şehir seçilmediyse uyarı mesajı
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lütfen önce bir şehir seçin."),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Obx(() => Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: locationController.allLocations
                .where((location) => location.city == selectedCity)
                .map((district) => ListTile(
                      title: Text(district.district),
                      onTap: () {
                        setState(() {
                          selectedDistrict = district.district;
                          selectedNeighborhood = null;
                          districtController.text = district.district;
                        });
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        ));
      },
    );
  }

  // Mahalle seçim popUp'ı
  void _showNeighborhoodPicker(BuildContext context) {
    if (selectedDistrict == null) {
      // İlçe seçilmediyse uyarı mesajı
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lütfen önce bir ilçe seçin."),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ekranın alt kenarına ulaşmasını önlemek için
      builder: (context) {
        return Obx(() => Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: locationController.allLocations
                .where((location) => location.district == selectedDistrict)
                .map((neighborhood) => ListTile(
                      title: Text(
                        neighborhood.neighborhood,
                        overflow: TextOverflow.ellipsis, // Taşmayı önlemek için
                        style: const TextStyle(
                          fontSize: 14, // Metin boyutunu ayarla
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedNeighborhood = neighborhood.neighborhood;
                          neighborhoodController.text = neighborhood.neighborhood;
                        });
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        ));
      },
    );
  }
}