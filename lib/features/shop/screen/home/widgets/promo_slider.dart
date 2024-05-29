import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Yüksekliği ayarlayın
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPromoBanner(AppImages.promoBanner1),
          _buildPromoBanner(AppImages.promoBanner2),
          _buildPromoBanner(AppImages.promoBanner3),
          // İhtiyaç duyulan kadar daha fazla promo banner ekleyebilirsiniz
        ],
      ),
    );
  }

  Widget _buildPromoBanner(String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: AppSizes.defaultSpace),
      child: SizedBox(
        width: 400, // Genişliği ayarlayın
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
