// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../core/constants/app_color.dart';

// Custom color scheme extension for theme
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.secondary,
    required this.secondaryDark,
    required this.secondaryLight,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.white,
    required this.black,
    required this.grey,
    required this.lightGrey,
    required this.darkGrey,
    required this.background,
    required this.surface,
    required this.card,
  });

  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color secondary;
  final Color secondaryDark;
  final Color secondaryLight;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color white;
  final Color black;
  final Color grey;
  final Color lightGrey;
  final Color darkGrey;
  final Color background;
  final Color surface;
  final Color card;

  @override
  AppColorScheme copyWith({
    Color? primary,
    Color? primaryDark,
    Color? primaryLight,
    Color? secondary,
    Color? secondaryDark,
    Color? secondaryLight,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? white,
    Color? black,
    Color? grey,
    Color? lightGrey,
    Color? darkGrey,
    Color? background,
    Color? surface,
    Color? card,
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      secondary: secondary ?? this.secondary,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      white: white ?? this.white,
      black: black ?? this.black,
      grey: grey ?? this.grey,
      lightGrey: lightGrey ?? this.lightGrey,
      darkGrey: darkGrey ?? this.darkGrey,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryDark: Color.lerp(secondaryDark, other.secondaryDark, t)!,
      secondaryLight: Color.lerp(secondaryLight, other.secondaryLight, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
    );
  }
}

class ThemeProvider {
  late BuildContext context;
  late double width;
  late TextTheme textTheme;

  ThemeProvider(this.context) {
    width = MediaQuery.of(context).size.width;
    textTheme = TextTheme(
      titleLarge: TextStyle(
        fontSize: width * 0.05,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: width * 0.04,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: width * 0.035,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: width * 0.04,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: width * 0.035,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: width * 0.03,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static const String fontFamily = "Poppins";

  ThemeData light() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: AppColor.background,
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.surface,
      error: AppColor.error,
      onBackground: AppColor.black,
      onSurface: AppColor.black,
      onPrimary: AppColor.white,
      onSecondary: AppColor.white,
      onError: AppColor.white,
    ),
    textTheme: textTheme,
    cardColor: AppColor.card,
    fontFamily: ThemeProvider.fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    // Additional color schemes for specific use cases
    extensions: <ThemeExtension<dynamic>>[
      AppColorScheme(
        primary: AppColor.primary,
        primaryDark: AppColor.primaryDark,
        primaryLight: AppColor.primaryLight,
        secondary: AppColor.secondary,
        secondaryDark: AppColor.secondaryDark,
        secondaryLight: AppColor.secondaryLight,
        success: AppColor.success,
        warning: AppColor.warning,
        error: AppColor.error,
        info: AppColor.info,
        white: AppColor.white,
        black: AppColor.black,
        grey: AppColor.grey,
        lightGrey: AppColor.lightGrey,
        darkGrey: AppColor.darkGrey,
        background: AppColor.background,
        surface: AppColor.surface,
        card: AppColor.card,
      ),
    ],
  );

  ThemeData dark() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: AppColor.black,
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.darkGrey,
      error: AppColor.error,
      onBackground: AppColor.white,
      onSurface: AppColor.white,
      onPrimary: AppColor.white,
      onSecondary: AppColor.white,
      onError: AppColor.white,
    ),
    textTheme: textTheme,
    cardColor: AppColor.darkGrey,
    fontFamily: ThemeProvider.fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.darkGrey,
      foregroundColor: AppColor.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    // Additional color schemes for specific use cases
    extensions: <ThemeExtension<dynamic>>[
      AppColorScheme(
        primary: AppColor.primary,
        primaryDark: AppColor.primaryDark,
        primaryLight: AppColor.primaryLight,
        secondary: AppColor.secondary,
        secondaryDark: AppColor.secondaryDark,
        secondaryLight: AppColor.secondaryLight,
        success: AppColor.success,
        warning: AppColor.warning,
        error: AppColor.error,
        info: AppColor.info,
        white: AppColor.white,
        black: AppColor.black,
        grey: AppColor.grey,
        lightGrey: AppColor.lightGrey,
        darkGrey: AppColor.darkGrey,
        background: AppColor.black,
        surface: AppColor.darkGrey,
        card: AppColor.darkGrey,
      ),
    ],
  );
}
