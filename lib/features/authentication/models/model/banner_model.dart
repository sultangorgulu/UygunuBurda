import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageurl;
  final String targetscreen;
  final bool active;
  String id;

  BannerModel({
    required this.imageurl,
    required this.targetscreen,
    required this.active,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'Imageurl': imageurl,
      'Targetscreen': targetscreen,
      'Active': active,
      'Id': id,
    };
  }

  BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : imageurl = snapshot.data()!['ImageUrl'] ?? '',
        targetscreen = snapshot.data()!['Targetscreen'] ?? '',
        id = snapshot.id,
        active = snapshot.data()!['Active'] ?? false;
}