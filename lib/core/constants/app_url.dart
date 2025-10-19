class AppUrl {
  static const String baseUrl = 'https://api.sportconnection.com';
  static const String apiVersion = 'v1';
  
  // Endpoints principaux
  static const String auth = '/auth';
  static const String users = '/users';
  static const String teams = '/teams';
  static const String tournaments = '/tournaments';
  static const String announcements = '/announcements';
  
  // URLs complètes
  static String get authUrl => '$baseUrl$auth';
  static String get usersUrl => '$baseUrl$users';
  static String get teamsUrl => '$baseUrl$teams';
  static String get tournamentsUrl => '$baseUrl$tournaments';
  static String get announcementsUrl => '$baseUrl$announcements';
}