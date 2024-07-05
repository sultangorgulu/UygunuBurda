import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getMarketsInNeighborhood(String neighborhood) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('markets')
          .where('neighborhood', isEqualTo: neighborhood)
          .get();

      List<String> marketNames = [];
      querySnapshot.docs.forEach((doc) {
        marketNames.add(doc['name']);
      });

      return marketNames;
    } catch (e) {
      print('Error fetching markets: $e');
      return [];
    }
  }
}
