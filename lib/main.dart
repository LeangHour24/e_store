import 'package:e_store/core/common/routes/app_route.dart';
import 'package:e_store/core/config/theme/app_theme.dart';
import 'package:e_store/core/controllers/theme_controller.dart';
import 'package:e_store/core/common/utils/text_scale_wrapper.dart';
import 'package:e_store/feactures/auth/view/screens/sign_in_screen.dart';
import 'package:e_store/feactures/onboarding/controllers/onboarding_controller.dart';
import 'package:e_store/feactures/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SplashController());
  Get.put(OnboardingController());
  Get.put(SignInScreen());
  await Get.putAsync(() async => ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return TextScaleWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multi_vender E_store App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeController.to.themeMode,
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.routes,
        ),
        );
  }
}