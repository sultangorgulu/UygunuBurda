import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/features/authentication/models/model/address_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';

class AddressCloud extends GetxController {
  static AddressCloud get instance => Get.find();

  final db = FirebaseFirestore.instance;

  // Kullanıcının adreslerini çekmek için metot
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }
      final snapshot = await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      final result = snapshot.docs
          .map((address) => AddressModel.fromSnapshot(address))
          .toList();

      return result;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  // Adres seçimini güncellemek için metot
  Future<void> updateSelectField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } catch (e) {
      throw 'Unable to update your address selection, Please try again later.';
    }
  }

  // Yeni adres eklemek için metot
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authuser!.uid;
      final currentAddress = await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());

      return currentAddress.id;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while saving Address Information, Please try again later.';
    }
  }
}
