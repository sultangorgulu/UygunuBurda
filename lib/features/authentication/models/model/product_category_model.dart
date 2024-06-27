import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'CategoryId': categoryId,
    };
  }

  ProductCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot)
      : productId = snapshot.data()!['productId'] ?? '',
        categoryId = snapshot.data()!['CategoryId'] ?? '';
}