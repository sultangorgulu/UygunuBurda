import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/firebase_storage_services.dart';
import 'package:uygunuburda/features/authentication/models/model/banner_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';

class BannerCloud extends GetxController {
  static BannerCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  // Tüm aktif bannerları çekmek için metot
  Future<List<BannerModel>> fetchAllBanners() async {
    try {
      final snapshot =
          await db.collection('Banners').where('Active', isEqualTo: true).get();
      final list =
          snapshot.docs.map((e) => BannerModel.fromSnapshot(e)).toList();
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

  // Dummy data yüklemek için metot
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(FirebaseStorageServices());

      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageurl);

        final url =
            await storage.uploadImageData('Banners', file, banner.imageurl);

        banner.imageurl = url;

        await db.collection('Banners').doc(banner.id).set(banner.toJson());
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
