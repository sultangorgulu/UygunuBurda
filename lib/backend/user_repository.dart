import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uygunuburda/backend/authentication_repository.dart';
import 'package:uygunuburda/features/authentication/models/model/user_model.dart';
import 'package:uygunuburda/util/exceptions/firebase_exceptions.dart';
import 'package:uygunuburda/util/exceptions/format_exceptions.dart';
import 'package:uygunuburda/util/exceptions/platform_exceptions.dart';

///Repository class for user related operations.

class UserRepository extends GetxController{
  static UserRepository get instance=> Get.find();

  final FirebaseFirestore _db=FirebaseFirestore.instance;
  ///Function to save user data to FireStore
  Future<void> saveUserRecord(UserModel user)async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
    }on FirebaseException catch(e){
    throw AppFirebaseException(e.code).message;
    }on FormatException catch(_){
    throw const AppFormatException();
    }on PlatformException catch(e) {
      throw AppPlatformException(e.code).message;
    } catch(e){
    throw 'Something went wrong. Please try again';
    }
  }

  ///Function to fetch user details based on user id.
  Future<UserModel> fetchUserDetails()async{
    try{
      final documentSnapshot=await _db.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();
      if(documentSnapshot.exists){
      // Retrieve data from snapshot
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        print(documentSnapshot);
        return UserModel.empty();
      }
    }on FirebaseException catch(e){
      throw AppFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const AppFormatException();
    }on PlatformException catch(e) {
      throw AppPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  ///Function to update user data in FireStore.
  Future<void> updateUserDetails(UserModel updateUser)async{
    try{
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
    }on FirebaseException catch(e){
      throw AppFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const AppFormatException();
    }on PlatformException catch(e) {
      throw AppPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  ///Update any fields in specific user collection.
  Future<void> updateSingleField(Map<String,dynamic> json)async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }on FirebaseException catch(e){
      throw AppFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const AppFormatException();
    }on PlatformException catch(e) {
      throw AppPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  ///Function to remove user data from FireStore.

  Future<void> removeUserRecord(String userId)async{
    try{
      await _db.collection('Users').doc(userId).delete();
    }on FirebaseException catch(e){
      throw AppFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const AppFormatException();
    }on PlatformException catch(e) {
      throw AppPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///Upload any image
  Future<String> uploadImage (String path,XFile image)async{
    try{
      final ref=FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url=await ref.getDownloadURL();
      return url;

    }on FirebaseException catch(e){
      throw AppFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const AppFormatException();
    }on PlatformException catch(e) {
      throw AppPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }

  }

}