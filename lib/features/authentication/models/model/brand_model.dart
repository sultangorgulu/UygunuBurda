import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isfeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isfeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isfeatured,
    };
  }

  BrandModel.fromJson(Map<String, dynamic> snapshot)
      : name = snapshot['Name'] ?? '',
        image = snapshot['Image'] ?? '',
        productsCount = snapshot['ProductsCount'] ?? 0,
        isfeatured = snapshot['IsFeatured'] ?? false,
        id = snapshot['Id'] ?? '';

  BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()!['Name'] ?? '',
        image = snapshot.data()!['Image'] ?? '',
        id = snapshot.id,
        isfeatured = snapshot['IsFeatured'] ?? false,
        productsCount = snapshot.data()!['ProductsCount'] ?? 0;
}