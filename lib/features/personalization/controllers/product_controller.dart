import 'package:get/get.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<Product> allProducts = <Product>[].obs;
  final isloading = false.obs;
  final productcloud = Get.put(ProductsCloud());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  fetchFeaturedProducts() async {
    try {
      isloading.value = true;
      final products = await productcloud.getFeaturedProducts();
      allProducts.assignAll(products);
    } catch (e) {
      AppLoaders.errorSnackbar(
          title: 'Oh Snap in productController!', message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<List<Product>> fetchAllFeaturedProducts() async {
    try {
      final products = await productcloud.getAllFeaturedProducts();
      return products;
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
  

  String getProductPrice(Product product) {
    return product.price.toString();
  }
}
