import 'package:get/get.dart';
import 'package:uygunuburda/database/brand_cloud.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isloading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandcloud = Get.put(BrandCloud());
  final productcloud = ProductsCloud.instance;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isloading.value = true;
      final brands = await brandcloud.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          brands.where((brand) => brand.isfeatured ?? false).take(4));
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands =
          await brandcloud.getBrandsForCategory(categoryId: categoryId);
      return brands;
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<List<Product>> getBrandProducts(String brandId) async {
    try {
      final products = await productcloud.getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}