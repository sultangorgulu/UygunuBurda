import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, 
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child:
        Column(
          children: [
            Image(
              width: AppHelperFunctions.screenWidth() * 1,
              height: AppHelperFunctions.screenHeight() * 0.8,
              image:  AssetImage(image)
              ),
      ],
    ),
    )
            ],
          );
  }
}