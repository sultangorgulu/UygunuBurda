import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/banner_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';

class BannerCloud extends GetxController {
  static BannerCloud get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

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



}
