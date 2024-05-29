import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:uygunuburda/features/authentication/screen/onboarding/onboarding.dart';
import 'package:uygunuburda/features/shop/screen/home/home.dart';
import 'package:uygunuburda/features/shop/screen/home/widgets/home_categories.dart';
import 'package:uygunuburda/features/shop/screen/store/store.dart';
import 'package:uygunuburda/features/shop/screen/wishlist/wishlist.dart';
import 'package:uygunuburda/features/shop/screens/profile/profile.dart';
import 'package:uygunuburda/navigation_menu.dart';
import 'package:uygunuburda/util/theme/theme.dart';

class App extends StatelessWidget {
  const App ({super.key});

  @override 
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const NavigationMenu() //onboardingscreen

    );
  }
}