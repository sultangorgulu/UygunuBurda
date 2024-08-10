import 'package:flutter/material.dart';

class MarketContainer extends StatelessWidget {
  final String marketName;
  final String logoUrl;
  final VoidCallback onPressed;

  const MarketContainer({
    super.key,
    required this.marketName,
    required this.logoUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 150, // Ensure the image does not exceed this width
                maxHeight: 150, // Ensure the image does not exceed this height
              ),
              child: Image.network(
                logoUrl,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Center(
                child: Text(
                  marketName,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis, // Handle overflowed text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
