import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../../../app/routes/app_routes.dart';

class SettingsController extends GetxController {
  final StorageService _storageService = Get.find();

  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  void _loadSettings() {
    isDarkMode.value = _storageService.getDarkMode();
  }

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    _storageService.setDarkMode(value);
    // TODO: Apply theme change
  }

  void goToProfile() {
    Get.toNamed(Routes.profile);
  }

  void changeLanguage() {
    Get.snackbar('Langue', 'Fonctionnalité en cours de développement');
  }

  void showHelp() {
    Get.snackbar('Aide', 'Fonctionnalité en cours de développement');
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Annuler')),
          TextButton(
            onPressed: () {
              _storageService.clearUser();
              Get.offAllNamed(Routes.login);
            },
            child: const Text('Déconnexion'),
          ),
        ],
      ),
    );
  }
}
