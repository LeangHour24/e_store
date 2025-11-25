import 'package:e_store/core/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = ThemeController.to;
      return PopupMenuButton<ThemeMode>(
        initialValue: controller.themeMode,
        onSelected: controller.setThemeMode,
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: ThemeMode.system,
            child: Text('System Default'),
          ),
          const PopupMenuItem(
            value: ThemeMode.system,
            child: Text('Light theme'),
          ),
          const PopupMenuItem(
            value: ThemeMode.system,
            child: Text('Dark theme'),
          ),
        ],
        child: ListTile(
          leading: Icon(controller.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
        title: const Text('Theme'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ); // PopupMenuButton
    }); // Obx
  }
}