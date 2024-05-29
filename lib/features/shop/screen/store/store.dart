import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:uygunuburda/common/widgets/images/circular_image.dart';
import 'package:uygunuburda/common/widgets/layouts/grid_layout.dart';
import 'package:uygunuburda/common/widgets/products/cart_menu_icon.dart';
import 'package:uygunuburda/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/category_tab.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/enum.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Store'),
          actions:[
            AppCartCounterIcon(onPressed: (){}, iconColor: AppColors.primary),
          ],
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: AppHelperFunctions.isDarkMode(context) ? AppColors.black: AppColors.white,
              expandedHeight: 440, 
      
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child:  ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const AppSearchContainer(text: 'Mağazalar arasında arayın', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: AppSizes.spaceBtwSections),
      
                    AppSectionHeading(title: 'Featured Brands', onPressed: () {}),
                    const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
      
                    AppGridLayout(itemCount: 4, itemBuilder: (_, index){
                      return GestureDetector(
                      onTap: (){},
                      child: AppRoundedContainer(
                        padding: const EdgeInsets.all(AppSizes.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            AppCircularImage(
                              image: AppImages.storeIcon,
                              backgroundColor: Colors.transparent,
                              isNetworkImage: false,
                              overlayColor: AppHelperFunctions.isDarkMode(context) ? AppColors.white : AppColors.black,
                              ),
                              const SizedBox(width: AppSizes.spaceBtwItems / 2),
                      
                              Column(
                                children: [
                                  const AppBrandTitleWithVerifiedIcon(title: 'title', brandTextSize: TextSizes.large),
                                  Text(
                                    '256 ',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  )
                                ]
                              )
                          ]
                          )
                      ),
                    );
      
                    }
                    )
      
                  ]
                ),
              ),
              
          bottom: const TabBar(
          tabs: [
            Tab(child: Text('Sebze')),
            Tab(child: Text('Sebze')),
            Tab(child: Text('Sebze')),
            Tab(child: Text('Sebze')),
            Tab(child: Text('Sebze')),
            Tab(child: Text('Sebze')),
          ],  
          ),
            )
          ];
        }, 

        body:const TabBarView(
          children: [
            AppCategoryTab(),
            AppCategoryTab(),
            AppCategoryTab(),
            AppCategoryTab(),
            
          ]
        )
        )
      )
     );
}
}





//iconcolorda değişiklik lazım