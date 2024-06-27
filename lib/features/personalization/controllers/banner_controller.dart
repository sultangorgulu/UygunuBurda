import 'package:get/get.dart';
import 'package:uygunuburda/database/banner_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/banner_model.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class BannnerController extends GetxController {
  static BannnerController get instance => Get.find();

  final Rx<int> currentpageIndex = 0.obs;
  final isloading = false.obs;
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatepageindex(index) {
    currentpageIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isloading.value = true;
      final bannercloud = Get.put(BannerCloud());
      final banners = await bannercloud.fetchAllBanners();
      allBanners.assignAll(banners);
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }
}