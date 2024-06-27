import 'dart:convert';

import 'package:get/get.dart';
import 'package:uygunuburda/database/products_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';
import 'package:uygunuburda/util/local_storage/storage_utility.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavorites();
    super.onInit();
  }

  void initFavorites() {
    final json = AppLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedfavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedfavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toogleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      AppLoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      AppLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      AppLoaders.customToast(
          message: 'Product has been removed to the Wishlist.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedjson = json.encode(favorites);
    AppLocalStorage.instance().saveData('favorites', encodedjson);
  }

  Future<List<Product>> getFavoritedProducts() async {
    return await ProductsCloud.instance
        .getFavoritedProducts(favorites.keys.toList());
  }
}