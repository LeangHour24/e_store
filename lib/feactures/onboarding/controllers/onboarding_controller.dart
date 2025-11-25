import 'package:e_store/feactures/onboarding/models/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();

  final pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingItems> items = [
    const OnboardingItems(
      title: 'Welcome to E-Shop',
      description: 'Discover Amazing products from various vendors',
      images: 'assets/images/1.png',
    ),
    const OnboardingItems(
      title: 'Easy Shopping',
      description: 'Shop your favorite products ',
      images: 'assets/images/1.png',
    ),
    const OnboardingItems(
      title: 'Easy delivery',
      description: 'Get your products delivered right to your doorstep',
      images: 'assets/images/1.png',
    ),
  ];
  void onPageChanged(int page) {
    currentPage.value = page;
  }
  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('IsFirstTime', false);
    Get.offAllNamed('AppRoutes.signIn');
  }
  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}