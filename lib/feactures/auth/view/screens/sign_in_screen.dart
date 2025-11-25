import 'package:e_store/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
  return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  body: SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            'Welcome Back!',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: isDark ? Colors.white : AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ), // Text
        ],
      ), // Column
    ), // SingleChildScrollView
  ), // SafeArea
); // Scaffold
}
}