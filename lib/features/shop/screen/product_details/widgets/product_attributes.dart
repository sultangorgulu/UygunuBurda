import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/chips/choice_chip.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/common/widgets/texts/product_price_text.dart';
import 'package:uygunuburda/common/widgets/texts/product_title_text.dart';
import 'package:uygunuburda/common/widgets/texts/section_heading.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppProductAttributes extends StatelessWidget {
  const AppProductAttributes({super.key});

  @override 
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        AppRoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundcolor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              Row(
              children: [
              const AppSectionHeading(title: 'Variation', showActionButton: false),
              const SizedBox(width: AppSizes.spaceBtwItems),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                  children: [
                  const AppProductTitleText(title:'Fiyat:', smallsize: true),
                  const SizedBox(width: AppSizes.spaceBtwItems),

                  Text(
                    '\$25',
                    style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(width: AppSizes.spaceBtwItems),
          
                  const AppProductPriceText(price:'20'),
                ],
              ),
                ],
                ),
            ],
            ),

            const AppProductTitleText(title: 'açıklama', smallsize: true, maxlines: 4),


            ]
          )
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        Column(
          children: [
            const AppSectionHeading(title:'Renkler'),
            const SizedBox(height: AppSizes.spaceBtwItems /2),
            AppChoiceChip(text: 'Green', selected: true, onSelected: (value) {},),
            AppChoiceChip(text: 'blue', selected: false, onSelected: (value) {}),
            AppChoiceChip(text: 'Sarı', selected: false, onSelected: (value) {}),

          ],
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title:'Renkler'),
            const SizedBox(height: AppSizes.spaceBtwItems /2),
            Wrap(
              spacing: 8,
              children: [
            AppChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
            AppChoiceChip(text: 'blue', selected: false, onSelected: (value) {}),
            AppChoiceChip(text: 'Sarı', selected: false, onSelected: (value) {}),
            AppChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
            AppChoiceChip(text: 'blue', selected: false, onSelected: (value) {}),
            AppChoiceChip(text: 'Sarı', selected: false, onSelected: (value) {}),
            AppChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
            AppChoiceChip(text: 'blue', selected: false, onSelected: (value) {}),
            AppChoiceChip(text: 'Sarı', selected: false, onSelected: (value) {}),

              ]
            )

      ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSectionHeading(title: 'size'),
              const SizedBox(height: AppSizes.spaceBtwItems/2),
              Wrap(
                spacing:8,
                children: [
              AppChoiceChip(text: '34', selected: true, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: false, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: false, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: true, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: false, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: false, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: true, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: false, onSelected: (value) {}),
              AppChoiceChip(text: '34', selected: false, onSelected: (value) {}),

                ],
              )
        
            ],)
      ],
    );
      
  }
}

