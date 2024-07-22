import 'package:get/get.dart';
import 'package:uygunuburda/database/location_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/location_model.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  final isLoading = false.obs;
  RxList<LocationModel> allLocations = <LocationModel>[].obs;
  final locationCloud = Get.put(LocationCloud());

  @override
  void onInit() {
    getAllLocations();
    super.onInit();
  }

  Future<void> getAllLocations() async {
    try {
      isLoading.value = true;
      final locations = await locationCloud.getAllLocations();
      allLocations.assignAll(locations);
    } catch (e) {
      
    } finally {
      isLoading.value = false;
    }
  }

  Future<LocationModel?> getLocationById(String locationId) async {
    try {
      return await locationCloud.getLocationById(locationId: locationId);
    } catch (e) {
      
      return null;
    }
  }

  Future<List<LocationModel>> getLocationsForCity({required String cityName}) async {
    try {
      return await locationCloud.getLocationsForCity(cityName: cityName);
    } catch (e) {
      
      return [];
    }
  }

  Future<List<LocationModel>> getLocationsForDistricts({required String districtsName}) async {
    try {
      return await locationCloud.getLocationsForDistricts(districtsName: districtsName);
    } catch (e) {
      
      return [];
    }
  }
}
