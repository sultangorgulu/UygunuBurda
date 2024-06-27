import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageServices extends GetxController {
  static FirebaseStorageServices get instance => Get.find();

  final firebasestorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data $e';
    }
  }

  Future<String> uploadImageData(
    String path,
    Uint8List image,
    String name,
  ) async {
    try {
      final ref = firebasestorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something went wrong! PLease try again.';
      }
    }
  }

  Future<String> uploadImageFile(
    String path,
    XFile image,
  ) async {
    try {
      final ref = firebasestorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something went wrong! PLease try again.';
      }
    }
  }
}