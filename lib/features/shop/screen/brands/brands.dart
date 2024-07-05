import 'package:flutter/material.dart';
import 'package:uygunuburda/backend/firebase_services.dart';

class BrandsScreen extends StatelessWidget {
  final String neighborhood;

  const BrandsScreen({Key? key, required this.neighborhood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketler - $neighborhood'),
      ),
      body: FutureBuilder<List<String>>(
        future: FirebaseService().getMarketsInNeighborhood(neighborhood),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Bu mahallede market bulunamadı.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final marketName = snapshot.data![index];
              return ListTile(
                title: Text(marketName),
                // Diğer detaylar ve işlevsellik buraya eklenebilir
              );
            },
          );
        },
      ),
    );
  }
}
