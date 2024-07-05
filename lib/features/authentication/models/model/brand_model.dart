import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isfeatured;
 

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isfeatured,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isfeatured,
    };
  }

  BrandModel.fromJson(Map<String, dynamic> snapshot)
      : name = snapshot['Name'] ?? '',
        image = snapshot['Image'] ?? '',
        isfeatured = snapshot['IsFeatured'] ?? false,
        id = snapshot['Id'] ?? '';

  BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()!['Name'] ?? '',
        image = snapshot.data()!['Image'] ?? '',
        id = snapshot.id,
        isfeatured = snapshot['IsFeatured'] ?? false;
         
}