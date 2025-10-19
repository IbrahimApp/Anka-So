import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../../../core/helpers/theme_helper.dart';
import '../../../../core/helpers/l10n_helper.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.flutter_dash,
                size: 80,
                color: ThemeHelper.primary(context),
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                L10nHelper.of(context).login,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),

              // Email field
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: L10nHelper.of(context).email,
                  prefixIcon: const Icon(Icons.email),
                  border: const OutlineInputBorder(),
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
                    labelText: L10nHelper.of(context).password,
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

              // Login button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.login,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : Text(L10nHelper.of(context).login),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Forgot password
              TextButton(
                onPressed: controller.goToForgotPassword,
                child: Text(L10nHelper.of(context).forgotPassword),
              ),
              const SizedBox(height: 16),

              // Sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(L10nHelper.of(context).noAccount),
                  TextButton(
                    onPressed: controller.goToSignup,
                    child: Text(L10nHelper.of(context).signup),
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
