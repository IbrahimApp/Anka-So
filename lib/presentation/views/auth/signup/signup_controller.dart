import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../app/routes/app_routes.dart';

class SignupController extends GetxController {
  final AuthService _authService = Get.find();
  final StorageService _storageService = Get.find();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nom requis';
    }
    if (value.length < 2) {
      return 'Nom trop court';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email requis';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email invalide';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mot de passe requis';
    }
    if (value.length < 6) {
      return 'Mot de passe trop court';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signup() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Erreur', 'Veuillez remplir tous les champs');
      return;
    }

    isLoading.value = true;

    try {
      final result = await _authService.signup(
        emailController.text,
        passwordController.text,
        nameController.text,
      );

      if (result['success']) {
        _storageService.setToken(result['token']);
        _storageService.setUser(result['user']);
        Get.offAllNamed(Routes.home);
      } else {
        Get.snackbar('Erreur', result['message']);
      }
    } catch (e) {
      Get.snackbar('Erreur', "Erreur d'inscription: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void goToLogin() {
    Get.back();
  }
}
