import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_category_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class BrandCategoryCloud extends GetxController {
  static BrandCategoryCloud get instance => Get.find();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brandCategory in brandCategories) {
        await db.collection('BrandCategory').add(brandCategory.toJson());
      }
      AppLoaders.successSnackbar(title: 'Data Uploaded');
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
