import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uygunuburda/features/authentication/models/model/brand_model.dart';

class Product {
  String id;
  double price;
  String title;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? categoryid;
  String? images; 

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    this.brand,
    this.categoryid,
    this.isFeatured,
    this.images, 
  });

  static Product empty() => Product(
        id: '',
        title: '',
        price: 0.0,
        thumbnail: '',
      );

  toJson() {
    return {
      'Title': title,
      'Price': price,
      'Images': images ?? '', 
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'CategoryId': categoryid,
      'Brand': brand!.toJson(),
    };
  }

  Product.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      :
        id = snapshot.id,
        title = snapshot.data()!['Title'] ?? '',
        price = double.parse((snapshot.data()!['Price'] ?? 0.0).toString()),
        isFeatured = snapshot.data()!['IsFeatured'] ?? false,
        thumbnail = snapshot.data()!['Thumbnail'] ?? '',
        categoryid = snapshot.data()!['CategoryId'] ?? '',
        images = snapshot.data()!['Image'] ?? '', // Tek bir resim olarak değiştirildi
        brand = BrandModel.fromJson(snapshot.data()!['Brand']);

  factory Product.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Product(
      id: snapshot.id,
      title: data['Title'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      thumbnail: data['Thumbnail'] ?? '',
      categoryid: data['CategoryId'] ?? '',
      images: data['Images'] ?? '', // Tek bir resim olarak değiştirildi
      brand: BrandModel.fromJson(data['Brand'] ?? ''),
    );
  }
}
