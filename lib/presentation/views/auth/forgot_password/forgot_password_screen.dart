import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forgot_password_controller.dart';
import '../../../../core/helpers/theme_helper.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mot de passe oublié')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Icon(
                Icons.lock_reset,
                size: 80,
                color: ThemeHelper.primary(context),
              ),
              const SizedBox(height: 32),

              // Title
              const Text(
                'Réinitialiser le mot de passe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                'Entrez votre email pour recevoir un lien de réinitialisation',
                style: TextStyle(
                  fontSize: 16,
                  color: ThemeHelper.grey(context),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

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
              const SizedBox(height: 24),

              // Send button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.sendResetEmail,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text('Envoyer'),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Back to login
              TextButton(
                onPressed: controller.goToLogin,
                child: const Text('Retour à la connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
