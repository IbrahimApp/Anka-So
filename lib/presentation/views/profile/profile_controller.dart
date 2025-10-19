import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';

class ProfileController extends GetxController {
  final StorageService _storageService = Get.find();

  final RxString userName = ''.obs;
  final RxString userEmail = ''.obs;
  final RxString userPhone = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  void _loadUserData() {
    final user = _storageService.getUser();
    if (user != null) {
      userName.value = user['name'] ?? '';
      userEmail.value = user['email'] ?? '';
      userPhone.value = user['phone'] ?? '';
    }
  }

  void editProfile() {
    Get.snackbar('Modification', 'Fonctionnalité en cours de développement');
  }

  void editName() {
    Get.dialog(
      AlertDialog(
        title: const Text('Modifier le nom'),
        content: TextField(
          controller: TextEditingController(text: userName.value),
          decoration: const InputDecoration(
            labelText: 'Nom complet',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Annuler')),
          TextButton(
            onPressed: () {
              // TODO: Update name
              Get.back();
            },
            child: const Text('Sauvegarder'),
          ),
        ],
      ),
    );
  }

  void editEmail() {
    Get.snackbar('Modification', 'Fonctionnalité en cours de développement');
  }

  void editPhone() {
    Get.snackbar('Modification', 'Fonctionnalité en cours de développement');
  }
}
