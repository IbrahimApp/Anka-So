import 'package:flutter/material.dart';

class AppSize {
  late BuildContext context;
  AppSize(this.context);
  
  // Tailles responsives
  double get small => MediaQuery.of(context).size.width * 0.0187;
  double get medium => MediaQuery.of(context).size.width * 0.03725;
  double get large => MediaQuery.of(context).size.width * 0.05583;
  double get extraLarge => MediaQuery.of(context).size.width * 0.07443;
  
  // Dimensions d'écran
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  
  // Espacements
  double get paddingSmall => 8.0;
  double get paddingMedium => 16.0;
  double get paddingLarge => 24.0;
  double get paddingExtraLarge => 32.0;
  
  // Rayons de bordure
  double get radiusSmall => 4.0;
  double get radiusMedium => 8.0;
  double get radiusLarge => 12.0;
  double get radiusExtraLarge => 16.0;
}