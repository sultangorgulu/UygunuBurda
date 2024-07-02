import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/product_models.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';

class ProductsCloud extends GetxController {
  static ProductsCloud get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Öne çıkan ürünleri çeken metod
  Future<List<Product>> getFeaturedProducts() async {
    try {
      final documents = await db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return documents.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong, Please try again';
    }
  }

  // Tüm öne çıkan ürünleri çeken metod
  Future<List<Product>> getAllFeaturedProducts() async {
    try {
      final documents = await db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return documents.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong, Please try again';
    }
  }

  // Belirli bir sorguya göre ürünleri çeken metod
  Future<List<Product>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<Product> productsList = querySnapshot.docs
          .map((e) => Product.fromQuerySnapshot(e))
          .toList();
      return productsList;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Belirli bir marka için ürünleri çeken metod
  Future<List<Product>> getProductsForBrand({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final snapshot = limit == -1
          ? await db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final result = snapshot.docs
          .map((product) => Product.fromSnapshot(product))
          .toList();

      return result;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Belirli bir kategori için ürünleri çeken metod
  Future<List<Product>> getProductsForCategory({
    required String categoryId,
    int limit = -1,
  }) async {
    try {
      print('CategoryId is $categoryId');
      final snapshot = limit == -1
          ? await db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      List<String> productId = snapshot.docs
          .map((doc) => (doc['ProductId'] as String).trim())
          .toList();

      print('ProductId is $productId');

      final products = await db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productId)
          .get();

      print('Products docs is ${products.docs}');

      final result = products.docs
          .map((product) => Product.fromSnapshot(product))
          .toList();
      print('Products is ${products.size}');
      print('result is $result');

      return result;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Kullanıcının favori ürünlerini çeken metod
  Future<List<Product>> getFavoritedProducts(List<String> productId) async {
    try {
      final snapshot = await db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productId)
          .get();

      final products =
          snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}