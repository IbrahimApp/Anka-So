import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  
  final RxBool isAuthenticated = false.obs;
  final RxString token = ''.obs;
  final RxMap<String, dynamic> user = <String, dynamic>{}.obs;
  
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock authentication logic
      if (email == 'test@test.com' && password == 'password') {
        final mockToken = 'mock_jwt_token_123';
        final mockUser = {
          'id': '1',
          'email': email,
          'name': 'Test User',
        };
        
        token.value = mockToken;
        user.value = mockUser;
        isAuthenticated.value = true;
        
        return {
          'success': true,
          'token': mockToken,
          'user': mockUser,
        };
      } else {
        return {
          'success': false,
          'message': 'Email ou mot de passe incorrect',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Erreur de connexion: $e',
      };
    }
  }
  
  Future<Map<String, dynamic>> signup(String email, String password, String name) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock signup logic
      final mockToken = 'mock_jwt_token_123';
      final mockUser = {
        'id': '1',
        'email': email,
        'name': name,
      };
      
      token.value = mockToken;
      user.value = mockUser;
      isAuthenticated.value = true;
      
      return {
        'success': true,
        'token': mockToken,
        'user': mockUser,
      };
    } catch (e) {
      return {'success': false, 'message': 'Erreur inscription: $e'};
    }
  }
  
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      return {
        'success': true,
        'message': 'Email de réinitialisation envoyé',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Erreur: $e',
      };
    }
  }
  
  void logout() {
    token.value = '';
    user.value = {};
    isAuthenticated.value = false;
  }
}