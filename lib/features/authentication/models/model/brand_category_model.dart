import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'CategoryId': categoryId,
    };
  }

  BrandCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot)
      : brandId = snapshot.data()!['brandId'] ?? '',
        categoryId = snapshot.data()!['CategoryId'] ?? '';
}