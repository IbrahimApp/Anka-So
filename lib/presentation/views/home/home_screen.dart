import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../../../core/helpers/theme_helper.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: controller.showNotifications,
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            _buildHomeTab(context),
            _buildProfileTab(context),
            _buildSettingsTab(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTab,
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80, color: ThemeHelper.primary(context)),
          const SizedBox(height: 16),
          const Text(
            'Bienvenue',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 80, color: ThemeHelper.primary(context)),
          const SizedBox(height: 16),
          const Text(
            'Profil utilisateur',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 80, color: ThemeHelper.primary(context)),
          const SizedBox(height: 16),
          const Text(
            'Paramètres',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
