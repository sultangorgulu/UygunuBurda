import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  String id;
  String city;
  String district;
  String neighborhood;

  LocationModel({
    required this.id,
    required this.city,
    required this.district,
    required this.neighborhood,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'City': city,
      'District': district,
      'Neighborhood': neighborhood,
    };
  }

  LocationModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        city = snapshot.data()!['City'] ?? '',
        district = snapshot.data()!['District'] ?? '',
        neighborhood = snapshot.data()!['Neighborhood'] ?? '';
}