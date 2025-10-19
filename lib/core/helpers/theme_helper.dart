import 'package:flutter/material.dart';
import '../../app/themes.dart';

class ThemeHelper {
  static AppColorScheme of(BuildContext context) {
    return Theme.of(context).extension<AppColorScheme>()!;
  }

  static Color primary(BuildContext context) => of(context).primary;
  static Color primaryDark(BuildContext context) => of(context).primaryDark;
  static Color primaryLight(BuildContext context) => of(context).primaryLight;
  static Color secondary(BuildContext context) => of(context).secondary;
  static Color secondaryDark(BuildContext context) => of(context).secondaryDark;
  static Color secondaryLight(BuildContext context) =>
      of(context).secondaryLight;
  static Color success(BuildContext context) => of(context).success;
  static Color warning(BuildContext context) => of(context).warning;
  static Color error(BuildContext context) => of(context).error;
  static Color info(BuildContext context) => of(context).info;
  static Color white(BuildContext context) => of(context).white;
  static Color black(BuildContext context) => of(context).black;
  static Color grey(BuildContext context) => of(context).grey;
  static Color lightGrey(BuildContext context) => of(context).lightGrey;
  static Color darkGrey(BuildContext context) => of(context).darkGrey;
  static Color background(BuildContext context) => of(context).background;
  static Color surface(BuildContext context) => of(context).surface;
  static Color card(BuildContext context) => of(context).card;
}
