import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final db = ProductsCloud.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<Product> products = <Product>[].obs;

  Future<List<Product>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await db.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price)); // price'a göre sıralama
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  // Yeni ürün atamak için metot
  void assignProduct(List<Product> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }
}