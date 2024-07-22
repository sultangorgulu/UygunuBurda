import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/features/authentication/models/model/user_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';

class UserCloud extends GetxController {
  static UserCloud get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final authRep = AuthenticationRepository.instance;

  // Kullanıcı kayıtlarını Firestore'a kaydetmek için metot
  Future<void> saveUserRecords(UserModel user) async {
    try {
      await db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  // Kullanıcı verilerini Firestore'dan çekmek için metot
  Future<UserModel> fetchUserData() async {
    try {
      final documentSnapshot =
          await db.collection('Users').doc(authRep.authUser?.uid).get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  // Kullanıcı verilerini güncellemek için metot
  Future<void> updateUserData(UserModel updatedUser) async {
    try {
      await db
          .collection('Users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  // Tek bir alanı güncellemek için metot
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await db.collection('Users').doc(authRep.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  // Kullanıcı verilerini silmek için metot
  Future<void> deleteUserData(String userId) async {
    try {
      await db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }

  // Profil fotoğrafını Firebase Storage'a yüklemek için metot
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw '';
    }
  }
}
