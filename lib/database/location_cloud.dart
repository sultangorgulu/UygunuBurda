import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/features/authentication/models/model/location_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';

class LocationCloud extends GetxController {
  static LocationCloud get instance => Get.find();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<LocationModel>> getAllLocations() async {
    try {
      final snapshot = await db.collection('Locations').get();
      return snapshot.docs
          .map((location) => LocationModel.fromSnapshot(location))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  Future<LocationModel?> getLocationById({required String locationId}) async {
    try {
      final snapshot = await db.collection('Locations').doc(locationId).get();
      if (snapshot.exists) {
        return LocationModel.fromSnapshot(snapshot);
      }
      return null;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  Future<List<LocationModel>> getLocationsForCity({required String cityName}) async {
    try {
      final snapshot = await db
          .collection('Locations')
          .where('City', isEqualTo: cityName)
          .get();
      return snapshot.docs
          .map((location) => LocationModel.fromSnapshot(location))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  Future<List<LocationModel>> getLocationsForDistricts({required String districtsName}) async {
    try {
      final snapshot = await db
          .collection('Locations')
          .where('Districts', isEqualTo: districtsName)
          .get();
      return snapshot.docs
          .map((location) => LocationModel.fromSnapshot(location))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on AppPlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }
}
