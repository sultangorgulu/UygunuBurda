import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:uygunuburda/features/authentication/models/model/store_model.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/enum.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppBrandCard extends StatelessWidget {
  final bool showBorder;
  final void Function()? onTap;

  const AppBrandCard({
    Key? key,
    this.onTap,
    required this.showBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('stores').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final stores = snapshot.data!.docs.map((doc) {
          return Store.fromFirestore(doc);
        }).toList();

        if (stores.isEmpty) {
          return const Center(child: Text('No stores available'));
        }

        // Örnek olarak ilk mağazayı alıyoruz, bu dinamik olarak değiştirilebilir
        final store = stores[0];

        return GestureDetector(
          onTap: onTap,
          child: AppRoundedContainer(
            showborder: showBorder,
            backgroundcolor: Colors.transparent,
            padding: const EdgeInsets.all(AppSizes.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AppCircularImage(
                    isNetworkImage: true, // Firebase Storage URL kullanıyoruz
                    // Firestore'dan alınan mağaza logosunu gösteriyoruz
                    image: store.storeLogo, // Firebase Storage URL'si
                    backgroundColor: Colors.transparent,
                    overlayColor: isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                const SizedBox(width: AppSizes.spaceBtwItems / 2),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mağaza ismini siyah renkte gösteriyoruz
                      AppBrandTitleWithVerifiedIcon(
                        title: store.storesName,
                        brandTextSize: TextSizes.large,
                        textColor: Colors.black, // Metin rengini siyah yapıyoruz
                      ),
                      // Konum bilgisi, siyah renkte ve tek satırda
                      Text(
                        store.location,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}