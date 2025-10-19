import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile section
          _buildSection(
            title: 'Profil',
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Informations personnelles'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: controller.goToProfile,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Preferences section
          _buildSection(
            title: 'Préférences',
            children: [
              Obx(
                () => SwitchListTile(
                  title: const Text('Mode sombre'),
                  subtitle: const Text('Activer le thème sombre'),
                  value: controller.isDarkMode.value,
                  onChanged: controller.toggleDarkMode,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Langue'),
                subtitle: const Text('Français'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: controller.changeLanguage,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // About section
          _buildSection(
            title: 'À propos',
            children: [
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Version'),
                subtitle: const Text('1.0.0'),
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Aide'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: controller.showHelp,
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Logout button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: controller.logout,
              icon: const Icon(Icons.logout),
              label: const Text('Se déconnecter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        Card(child: Column(children: children)),
      ],
    );
  }
}
