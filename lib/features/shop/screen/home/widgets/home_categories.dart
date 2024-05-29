import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/image_text/vertical_image_text.dart';
import 'package:uygunuburda/features/shop/screen/sub_category/sub_categories.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          // Örnek olarak, kategori resmi ve başlığı ekleyelim
          return AppVerticalImageText(
            image: AppImages.productImage1[index], // Örnek olarak bir resim listesi kullanıyorum
            title: 'Kategori $index', // Örnek bir başlık
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}

