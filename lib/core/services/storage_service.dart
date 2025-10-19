import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // Token management
  String? getToken() {
    return _prefs.getString('token');
  }

  void setToken(String token) {
    _prefs.setString('token', token);
  }

  void clearToken() {
    _prefs.remove('token');
  }

  // User management
  Map<String, dynamic>? getUser() {
    final userString = _prefs.getString('user');
    if (userString != null) {
      try {
        // Simple JSON-like parsing for user data
        return {'id': userString};
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  void setUser(Map<String, dynamic> user) {
    _prefs.setString('user', user['id'] ?? '');
  }

  void clearUser() {
    _prefs.remove('user');
    clearToken();
  }

  // Authentication status
  bool isAuthenticated() {
    return getToken() != null;
  }

  // Onboarding status
  bool hasSeenOnboarding() {
    return _prefs.getBool('onboarding_completed') ?? false;
  }

  void setOnboardingCompleted(bool completed) {
    _prefs.setBool('onboarding_completed', completed);
  }

  // Theme preferences
  bool getDarkMode() {
    return _prefs.getBool('dark_mode') ?? false;
  }

  void setDarkMode(bool isDark) {
    _prefs.setBool('dark_mode', isDark);
  }
}
