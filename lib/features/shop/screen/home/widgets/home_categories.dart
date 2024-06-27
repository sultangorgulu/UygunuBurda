import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/image_text/vertical_image_text.dart';
import 'package:uygunuburda/features/authentication/models/controller/category_controller.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/category_shimmer.dart';
import 'package:uygunuburda/features/shop/screen/sub_category/sub_categories.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isloading.value) return const AppCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categoryController.featuredCategories[index];
          return AppVerticalImageText(
            image: AppImages.productImage1[index], // Örnek olarak bir resim listesi kullanıyorum
            title: 'Kategori $index', // Örnek bir başlık
            onTap: () => Get.to(() =>  SubCategoriesScreen(category: category)),
          );
        },
      ),
    );
    }
    );
  }
}

