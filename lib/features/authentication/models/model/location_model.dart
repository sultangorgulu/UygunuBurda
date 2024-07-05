import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String city;
  final String districts;
  final String neighborhoods;
  final String id;

  LocationModel({
    required this.city,
    required this.districts,
    required this.neighborhoods,
    required this.id,
  });

  factory LocationModel.fromSnapshot(DocumentSnapshot snapshot) {
    return LocationModel(
      city: snapshot['City'] as String,
      districts: snapshot['Districts'] as String,
      neighborhoods: snapshot['Neighborhoods'] as String,
      id: snapshot.id,
    );
  }
}