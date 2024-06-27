import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/util/bindings/general_binding.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/shared/app_routers.dart';
import 'package:uygunuburda/util/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
 return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      getPages: AppAppRoutes.pages,
      home: const Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.white,
      
     ),
        ),
      ),
    );
  }
}