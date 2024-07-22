import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
      'CategoryId': id,
    };
  }

  CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()!['Name'] ?? '',
        image = snapshot.data()!['Image'] ?? '',
        parentId = snapshot.data()!['ParentId'] ?? '',
        isFeatured = snapshot.data()!['IsFeatured'] ?? false,
        id = snapshot.data()!['CategoryId'] ?? '';
}