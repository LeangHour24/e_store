import 'package:e_store/feactures/auth/view/screens/sign_in_screen.dart';
import 'package:e_store/feactures/onboarding/screens/onboarding_screen.dart';
import 'package:e_store/feactures/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/signin';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
  ];
}