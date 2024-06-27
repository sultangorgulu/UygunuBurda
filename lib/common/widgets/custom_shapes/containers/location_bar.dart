import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LocationBar extends StatefulWidget {
  const LocationBar({Key? key});

  @override
  _LocationBarState createState() => _LocationBarState();
}

class _LocationBarState extends State<LocationBar> {
  String _selectedLocation = 'Konum Seçilmedi'; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Iconsax.location, color: Colors.grey), // Konum simgesi (iconsax kullanıldı)
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            _selectedLocation,
            style: const TextStyle(fontSize: 16, color: Colors.black), // Metin rengi siyah olarak değiştirildi
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const Icon(Iconsax.arrow_bottom, color: Colors.grey), // Aşağı ok simgesi (iconsax kullanıldı)
          onPressed: () {
            // Konum seçeneklerini göstermek için bir işlevsellik eklenebilir
          },
        ),
      ],
    );
  }
}
