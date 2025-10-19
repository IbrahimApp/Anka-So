import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../presentation/views/splash/splash_binding.dart';
import '../../presentation/views/splash/splash_screen.dart';
import '../../presentation/views/onboarding/onboarding_binding.dart';
import '../../presentation/views/onboarding/onboarding_screen.dart';
import '../../presentation/views/auth/login/login_binding.dart';
import '../../presentation/views/auth/login/login_screen.dart';
import '../../presentation/views/auth/signup/signup_binding.dart';
import '../../presentation/views/auth/signup/signup_screen.dart';
import '../../presentation/views/auth/forgot_password/forgot_password_binding.dart';
import '../../presentation/views/auth/forgot_password/forgot_password_screen.dart';
import '../../presentation/views/home/home_binding.dart';
import '../../presentation/views/home/home_screen.dart';
import '../../presentation/views/profile/profile_binding.dart';
import '../../presentation/views/profile/profile_screen.dart';
import '../../presentation/views/settings/settings_binding.dart';
import '../../presentation/views/settings/settings_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
  ];
}
