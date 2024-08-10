import 'package:get/get.dart';
import 'package:uygunuburda/database/brand_cloud.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';

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
    } finally {
      isloading.value = false;
    }
  }

  Future<List<Product>> getBrandProducts(String brandId) async {
    try {
      final products = await productcloud.getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      
      return [];
    }
  }

  Future<List<BrandModel>> getBrandsForNeighborhood(int neighborhoodId) async {
    try {
      final brands = await brandcloud.getAllBrands();
      return brands.where((brand) {
        return brandNeighborhoods.any((bn) => bn.brandId == brand.id && bn.neighborhoodId == neighborhoodId);
      }).toList();
    } catch (e) {
      
      return [];
    }
  }

  // Brand ve Neighborhood ilişkilerini tutan bir liste.
  List<BrandNeighborhood> brandNeighborhoods = [
    BrandNeighborhood(brandId: 1, neighborhoodId: 1),
    // Diğer ilişkiler...
  ];
}

class BrandNeighborhood {
  final int brandId;
  final int neighborhoodId;

  BrandNeighborhood({required this.brandId, required this.neighborhoodId});
}
