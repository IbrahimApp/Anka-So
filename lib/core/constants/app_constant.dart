class AppConstant {
  // URLs
  static const String baseUrl = 'https://api.sportconnection.com';
  static const String apiVersion = 'v1';
  
  // Timeouts
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Cache
  static const int cacheExpiration = 3600; // 1 heure
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 50;
}