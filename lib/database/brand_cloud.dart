import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/firebase_storage_services.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class BrandCloud extends GetxController {
  static BrandCloud get instance => Get.find();
  final FirebaseFirestore db = FirebaseFirestore.instance;


  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await db.collection('Brands').get();
      return snapshot.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
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

  Future<List<BrandModel>> getBrandsForCategory({required String categoryId}) async {
    try {
      final brandCategoryQuery = await db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      final brandIDs = brandCategoryQuery.docs
          .map((doc) => (doc['brandId'] as String).trim())
          .toList();

      final brandsQuery = await db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIDs)
          .get();

      return brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
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
