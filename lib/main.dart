import 'package:ankaso/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;
import 'generated/l10n/app_localizations.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'core/services/storage_service.dart';
import 'core/services/auth_service.dart';
import 'core/services/config_service.dart';
import 'app/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize services
  await _initServices();

  runApp(const MyApp());
}

Future<void> _initServices() async {
  developer.log('🚀 Initialisation des services...');

  // Initialize storage service
  developer.log('📦 Initialisation du service de stockage...');
  await Get.putAsync(() => StorageService().init());
  developer.log('✅ Service de stockage initialisé');

  // Initialize auth service
  developer.log('🔐 Initialisation du service d\'authentification...');
  Get.put(AuthService());
  developer.log('✅ Service d\'authentification initialisé');

  // Initialize config service
  developer.log('⚙️ Initialisation du service de configuration...');
  Get.put(ConfigService());
  developer.log('✅ Service de configuration initialisé');

  developer.log('🎉 Tous les services ont été initialisés avec succès!');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Anka So',
      theme: ThemeProvider(context).light(),
      darkTheme: ThemeProvider(context).dark(),
      themeMode: ThemeMode.system,
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', ''), // Français
        Locale('en', ''), // Anglais
      ],
    );
  }
}
