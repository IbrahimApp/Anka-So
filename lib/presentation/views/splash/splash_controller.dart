import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate initialization delay
    await Future.delayed(const Duration(seconds: 3));

    // Navigate to onboarding
    Get.offAllNamed(Routes.onboarding);
  }
}
