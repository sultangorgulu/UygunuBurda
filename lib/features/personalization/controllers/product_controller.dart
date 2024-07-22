import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<Product> allProducts = <Product>[].obs;
  final isLoading = false.obs;
  final productCloud = Get.put(ProductsCloud());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productCloud.getFeaturedProducts();
      allProducts.assignAll(products);
    } catch (e) {
      AppLoaders.errorSnackbar(
          title: ' in productController!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Product>> fetchAllFeaturedProducts() async {
    try {
      final products = await productCloud.getAllFeaturedProducts();
      return products;
    } catch (e) {
      
      return [];
    }
  }
  

  String getProductPrice(Product product) {
    return product.price.toString();
  }

   Future<void> searchProducts(String query) async {
    isLoading(true);
    try {
      var products = await ProductsCloud.instance.fetchProductsByQuery(
        FirebaseFirestore.instance
            .collection('Products')
            .where('Title', isGreaterThanOrEqualTo: query)
            .where('Title', isLessThanOrEqualTo: query + '\uf8ff'),
      );
      allProducts.assignAll(products);
    } finally {
      isLoading(false);
    }
  }
}
