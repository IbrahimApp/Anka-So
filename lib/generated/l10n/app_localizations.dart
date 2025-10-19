import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// Le titre de l'application
  ///
  /// In fr, this message translates to:
  /// **'Anka So'**
  String get appTitle;

  /// Message de bienvenue
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get welcome;

  /// Bouton de connexion
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get login;

  /// Bouton d'inscription
  ///
  /// In fr, this message translates to:
  /// **'Inscription'**
  String get signup;

  /// Champ email
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get email;

  /// Champ mot de passe
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// Lien mot de passe oublié
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get forgotPassword;

  /// Texte pour les utilisateurs sans compte
  ///
  /// In fr, this message translates to:
  /// **'Pas de compte ? '**
  String get noAccount;

  /// Texte pour les utilisateurs avec compte
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ? '**
  String get alreadyHaveAccount;

  /// Onglet accueil
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get home;

  /// Onglet profil
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profile;

  /// Onglet paramètres
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// Option mode sombre
  ///
  /// In fr, this message translates to:
  /// **'Mode sombre'**
  String get darkMode;

  /// Option langue
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// Bouton de déconnexion
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get logout;

  /// Bouton passer
  ///
  /// In fr, this message translates to:
  /// **'Passer'**
  String get skip;

  /// Bouton suivant
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// Bouton précédent
  ///
  /// In fr, this message translates to:
  /// **'Précédent'**
  String get previous;

  /// Bouton commencer
  ///
  /// In fr, this message translates to:
  /// **'Commencer'**
  String get getStarted;

  /// Texte de chargement
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// Message d'erreur
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get error;

  /// Message de succès
  ///
  /// In fr, this message translates to:
  /// **'Succès'**
  String get success;

  /// Bouton réessayer
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get retry;

  /// Titre du modal des conditions
  ///
  /// In fr, this message translates to:
  /// **'Conditions Générales d\'Utilisation'**
  String get termsOfUse;

  /// Description du modal des conditions
  ///
  /// In fr, this message translates to:
  /// **'Pour procéder à la création de votre compte, vous devez accepter les conditions d\'utilisation.'**
  String get termsDescription;

  /// Texte de la checkbox des conditions
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte les conditions générales d\'utilisation d\'Anka So.'**
  String get acceptTerms;

  /// Bouton de validation
  ///
  /// In fr, this message translates to:
  /// **'Valider'**
  String get validate;

  /// Titre de la première page d'onboarding
  ///
  /// In fr, this message translates to:
  /// **'Trouvez votre logement \nidéal en un clin d\'œil'**
  String get findYourIdealHome;

  /// Description de la première page d'onboarding
  ///
  /// In fr, this message translates to:
  /// **'Découvrez des milliers de propriétés et trouvez votre nouveau chez-vous en quelques clics.'**
  String get findYourIdealHomeDescription;

  /// Titre de la deuxième page d'onboarding
  ///
  /// In fr, this message translates to:
  /// **'Recherchez selon vos \ncritères en toute \nsimplicité'**
  String get searchByYourCriteria;

  /// Description de la deuxième page d'onboarding
  ///
  /// In fr, this message translates to:
  /// **'Filtrez par prix, localisation, type de bien et trouvez exactement ce que vous cherchez.'**
  String get searchByYourCriteriaDescription;

  /// Titre de la troisième page d'onboarding
  ///
  /// In fr, this message translates to:
  /// **'Réservez votre\nnouveau chez-vous\ndès aujourd\'hui'**
  String get bookYourNewHome;

  /// Description de la troisième page d'onboarding
  ///
  /// In fr, this message translates to:
  /// **'Rejoignez des milliers de personnes qui ont trouvé leur bonheur immobilier avec nous.'**
  String get bookYourNewHomeDescription;

  /// Début du texte de description des conditions
  ///
  /// In fr, this message translates to:
  /// **'Pour procéder à la création de votre compte, vous devez accepter '**
  String get termsDescriptionText;

  /// Texte du lien vers les conditions
  ///
  /// In fr, this message translates to:
  /// **'les conditions d\'utilisation'**
  String get termsLinkText;

  /// Fin du texte de description des conditions
  ///
  /// In fr, this message translates to:
  /// **'.'**
  String get termsDescriptionEnd;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
