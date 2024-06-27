import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final String id;
  final String storesName;
  final String location;
  final String storeLogo; // Yeni eklenen logo alanı

  Store({
    required this.id,
    required this.storesName,
    required this.location,
    required this.storeLogo,
  });

  // Firestore belgesinden model oluşturan fabrika metodu
  factory Store.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Store(
      id: doc.id,
      storesName: data['stores_name'] ?? '',
      location: data['location'] ?? '',
      storeLogo: data['store_logo'] ?? '', // Varsayılan olarak boş string
    );
  }

  // Modeli bir Firestore belgesine dönüştüren metod
  Map<String, dynamic> toFirestore() {
    return {
      'stores_name': storesName,
      'location': location,
      'store_logo': storeLogo, // Logo alanını da ekliyoruz
    };
  }
}
