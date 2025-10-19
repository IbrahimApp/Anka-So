import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/auth_service.dart';

class ForgotPasswordController extends GetxController {
  final AuthService _authService = Get.find();

  final emailController = TextEditingController();
  final RxBool isLoading = false.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email requis';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email invalide';
    }
    return null;
  }

  Future<void> sendResetEmail() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Erreur', 'Veuillez entrer votre email');
      return;
    }

    isLoading.value = true;

    try {
      final result = await _authService.forgotPassword(emailController.text);

      if (result['success']) {
        Get.snackbar('Succès', result['message']);
        Get.back();
      } else {
        Get.snackbar('Erreur', result['message']);
      }
    } catch (e) {
      Get.snackbar('Erreur', 'Erreur: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void goToLogin() {
    Get.back();
  }
}
