import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/product_category_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';

class ProductCategoryCloud extends GetxController {
  static ProductCategoryCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  // Tüm ürün kategorilerini çekmek için metot
  Future<List<ProductCategoryModel>> getAllProductCategories() async {
    try {
      final snapshot = await db.collection('ProductCategory').get();
      final list = snapshot.docs
          .map((e) => ProductCategoryModel.fromSnapshot(e))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Belirli bir ürün için kategori bilgilerini çekmek için metot
  Future<List<ProductCategoryModel>> getProductCategoriesByProductId(
      String productId) async {
    try {
      final snapshot = await db
          .collection('ProductCategory')
          .where('productId', isEqualTo: productId)
          .get();

      final list = snapshot.docs
          .map((e) => ProductCategoryModel.fromSnapshot(e))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Belirli bir kategori için ürün bilgilerini çekmek için metot
  Future<List<ProductCategoryModel>> getProductCategoriesByCategoryId(
      String categoryId) async {
    try {
      final snapshot = await db
          .collection('ProductCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      final list = snapshot.docs
          .map((e) => ProductCategoryModel.fromSnapshot(e))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
