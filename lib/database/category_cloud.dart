import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/firebase_storage_services.dart';
import 'package:uygunuburda/features/authentication/models/model/category_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class CategoryCloud extends GetxController {
  static CategoryCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await db.collection('Categories').get();
      final list =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return list;
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

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final subcategories =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return subcategories;
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

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(FirebaseStorageServices());

      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        await db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }

      AppLoaders.successSnackbar(title: 'Data Uploaded');
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