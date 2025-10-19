import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              const Text(
                'Créer un compte',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Name field
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Nom complet',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: controller.validateName,
              ),
              const SizedBox(height: 16),

              // Email field
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
              ),
              const SizedBox(height: 16),

              // Password field
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: !controller.isPasswordVisible.value,
                  validator: controller.validatePassword,
                ),
              ),
              const SizedBox(height: 24),

              // Signup button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.signup,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("S'inscrire"),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Login link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Déjà un compte ? '),
                  TextButton(
                    onPressed: controller.goToLogin,
                    child: const Text('Se connecter'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
