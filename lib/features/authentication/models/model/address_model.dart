import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uygunuburda/util/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String neighbourhood;
  final String city;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.neighbourhood,
    required this.city,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => AppFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        neighbourhood: '',
        city: '',
        country: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'neighbourhood': neighbourhood,
      'City': city,
      'Country': country,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  AddressModel.fromJson(Map<String, dynamic> snapshot)
      : id = snapshot['Id'] as String,
        name = snapshot['Name'] as String,
        phoneNumber = snapshot['PhoneNumber'] as String,
        neighbourhood = snapshot['neighbourhood'] as String,
        city = snapshot['City'] as String,
        country = snapshot['Country'] as String,
        dateTime = (snapshot['DateTime'] as Timestamp).toDate(),
        selectedAddress = snapshot['SelectedAddress'] as bool;

  AddressModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        name = snapshot['Name'] ?? '',
        phoneNumber = snapshot['PhoneNumber'] ?? '',
        neighbourhood = snapshot['neighbourhood'] ?? '',
        city = snapshot['City'] ?? '',
        country = snapshot['Country'] ?? '',
        dateTime = (snapshot['DateTime'] as Timestamp).toDate(),
        selectedAddress = snapshot['SelectedAddress'] as bool;

  @override
  String toString() {
    return '$neighbourhood, $city, $country';
  }
}