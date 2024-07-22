import 'package:get/get.dart';
import 'package:uygunuburda/database/category_cloud.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/category_model.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isloading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final categorycloud = Get.put(CategoryCloud());
  final productcloud = ProductsCloud.instance;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isloading.value = true;

      final categories = await categorycloud.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(
        allCategories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(18)
            .toList(),
      );
    } catch (e) {
      
    } finally {
      isloading.value = false;
    }
  }

  Future<List<Product>> getCategoryProducts(String categoryId) async {
    try {
      final products =
          await productcloud.getProductsForCategory(categoryId: categoryId);
      return products;
    } catch (e) {
      
      return [];
    }
  }


  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subcategories = await categorycloud.getSubCategories(categoryId);
      return subcategories;
    } catch (e) {
      
      return [];
    }
  }
}