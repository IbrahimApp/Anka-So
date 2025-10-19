import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;

class ConfigService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxString termsOfUseUrl = ''.obs;
  final RxString privacyPolicyUrl = ''.obs;
  final RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadConfig();
  }

  Future<void> loadConfig() async {
    try {
      developer.log('📡 Chargement de la configuration Firebase...');
      isLoading.value = true;

      // Récupérer les URLs depuis Firebase
      final configDoc = await _firestore
          .collection('app_config')
          .doc('config')
          .get();

      if (configDoc.exists) {
        developer.log('📄 Document de configuration trouvé');
        final data = configDoc.data()!;

        // Récupérer l'URL des conditions d'utilisation
        if (data['terms_of_use'] != null) {
          final termsData = data['terms_of_use'] as Map<String, dynamic>;
          if (termsData['isActive'] == true) {
            // Utiliser la langue française par défaut
            termsOfUseUrl.value =
                termsData['languages']?['fr'] ?? termsData['url'] ?? '';
            developer.log(
              '✅ URL des conditions d\'utilisation chargée: ${termsOfUseUrl.value}',
            );
          }
        }

        // Récupérer l'URL de la politique de confidentialité
        if (data['privacy_policy'] != null) {
          final privacyData = data['privacy_policy'] as Map<String, dynamic>;
          if (privacyData['isActive'] == true) {
            // Utiliser la langue française par défaut
            privacyPolicyUrl.value =
                privacyData['languages']?['fr'] ?? privacyData['url'] ?? '';
            developer.log(
              '✅ URL de la politique de confidentialité chargée: ${privacyPolicyUrl.value}',
            );
          }
        }
      } else {
        developer.log('⚠️ Document de configuration non trouvé dans Firebase');
      }
    } catch (e) {
      developer.log('❌ Erreur lors du chargement de la configuration: $e');
    } finally {
      isLoading.value = false;
      developer.log('🏁 Chargement de la configuration terminé');
    }
  }
}
