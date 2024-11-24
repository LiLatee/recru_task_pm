import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/golden_test.dart';
import 'package:intl/intl.dart';
import 'package:recru_task_pm/core/tests_manager.dart';
import 'package:recru_task_pm/core/theme.dart';
import 'package:recru_task_pm/dependencies.dart';
import 'package:recru_task_pm/l10n/l10n.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  sl.registerLazySingleton(TestsManager.new);
  sl<TestsManager>().duringTestExecution = true;

  await setupFonts();

  goldenTestSupportedLocales = AppLocalizations.supportedLocales;
  goldenTestLocalizationsDelegates = const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  goldenTestThemeInTests = themeData;
  goldenTestDarkThemeInTests = themeDataDark;

  goldenTestSupportedLocales = [
    const Locale('pl'),
  ];

  goldenTestSupportedThemes = [
    Brightness.light,
  ];

  globalSetup = (locale) async => Intl.systemLocale = locale.languageCode;

  goldenTestDifferenceTolerance(0.06);

  return testMain();
}

Future<void> setupFonts() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await (FontLoader('Roboto')..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'))).load();
}
