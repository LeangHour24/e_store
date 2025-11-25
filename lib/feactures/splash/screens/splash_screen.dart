import 'package:e_store/core/config/theme/app_colors.dart';
import 'package:e_store/feactures/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _rotateAnimation;

@override
void initState() {
  super.initState();
  _setupAnimations();
  _handleNavigation();
}

Future<void> _handleNavigation() async {
  await Future.delayed(const Duration(milliseconds: 3000));

  if (!mounted) return;

  final route = await SplashController.to.determineInitialRoute();
  Get.offAllNamed(route);
}
  void _setupAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut)),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic)),
    );

    _slideAnimation = Tween<double>(begin: -30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic)),
    );

    _rotateAnimation = Tween<double>(begin: 0.2, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic)),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.forward();
    });
  }




  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ?const Color(0xFF09122C) : Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => _buildAnimatedContent(isDark),
        ),
      ),
    );
  }
  Widget _buildAnimatedContent(bool isDark) {
  return Transform.translate(
    offset: Offset(0, _slideAnimation.value),
    child: Transform.rotate(
      angle: _rotateAnimation.value,
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: _buildSplashContent(isDark),
        ), // FadeTransition
      ), // Transform.scale
    ), // Transform.rotate
  ); // Transform.translate
}
  Widget _buildSplashContent(bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildlogoContainer(),
        const SizedBox(height: 24),
        _buildApptitle(isDark),
        const SizedBox(height: 8),
        _buildAppsubtitle(isDark),
      ],);
  }
    Widget _buildlogoContainer() {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          AppColors.primary,
          AppColors.primary.withOpacity(0.8),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ), // LinearGradient
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withOpacity(0.3),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ), // BoxShadow
      ],
    ),
    child: Icon(
      Icons.shopping_bag_outlined,
      size: 48,
      color: AppColors.white.withOpacity(0.95),
    ),// BoxDecoration
  ); // Container
}
  Widget _buildApptitle(bool isDark) {
    return Text(
      'E-Store',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: isDark ? AppColors.white : AppColors.primary,
        letterSpacing: 1.5,
      ),
    );
  }
  Widget _buildAppsubtitle(bool isDark) {
    return Text(
      'Your One-Stop Shop',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: (isDark ? AppColors.white : AppColors.textDark).withOpacity(0.7),
        letterSpacing: 0.5,
      ),
    );
  }
}