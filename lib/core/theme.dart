import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0DDEAE);

const ColorScheme lightColorScheme = ColorScheme.light(
  onInverseSurface: Color(0xFFF1F0F7),
  inverseSurface: Color(0xFF2F3036),
  onPrimary: Color(0xFFFFFFFF),
  onPrimaryContainer: primaryColor,
  onSecondaryContainer: Color(0xFF161B2C),
  onSurface: Color(0xFF171C1F),
  onSurfaceVariant: Color(0xFF45464F),
  outline: Color(0xFF757680),
  primary: Color(0xFF4B5C92),
  primaryContainer: Color(0xFFEFEFEF),
  primaryFixedDim: Color(0xFFB4C5FF),
  scrim: Color(0xFF000000),
  secondary: Color(0xFF595E72),
  secondaryContainer: Color(0xFFDDE1F9),
  secondaryFixedDim: Color(0xFFC1C5DD),
  surface: Color(0xFFEFEFEF),
  surfaceContainer: Color(0xFFE4ECED),
  surfaceContainerHigh: Color(0xFFE9E7EF),
  surfaceContainerLow: Color(0xFFFBF9F9),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerHighest: Color(0xFFE2E1EC),
);

const ColorScheme darkColorScheme = ColorScheme.dark(
  brightness: Brightness.dark,
  onInverseSurface: Color(0xFF2F3036),
  inverseSurface: Color(0xFFE3E2E9),
  onPrimary: Color(0xFF1B2D60),
  onPrimaryContainer: Color(0xFFDBE1FF),
  onSecondaryContainer: Color(0xFFDDE1F9),
  onSurface: Color(0xFFDFE3E7),
  onSurfaceVariant: Color(0xFFC5C6D0),
  outline: Color(0xFF8F909A),
  primary: Color(0xFFB4C5FF),
  primaryContainer: Color(0xFF334478),
  primaryFixedDim: Color(0xFFB4C5FF),
  scrim: Color(0xFF000000),
  secondary: Color(0xFF595E72),
  secondaryContainer: Color(0xFF414659),
  secondaryFixedDim: Color(0xFFC1C5DD),
  surface: Color(0xFF121318),
  surfaceContainer: Color(0xFF1E1F25),
  surfaceContainerHigh: Color(0xFF292A2F),
  surfaceContainerLow: Color(0xFF1A1B21),
  surfaceContainerLowest: Color(0xFF0D0E13),
  surfaceContainerHighest: Color(0xFFE2E1EC),
);

const String fontFamily = 'Roboto';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  fontFamily: fontFamily,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 22 / 20,
      color: Color(0xFF313130),
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  fontFamily: fontFamily,
  brightness: Brightness.dark,
);
