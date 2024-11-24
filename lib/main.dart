import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recru_task_pm/core/theme.dart';
import 'package:recru_task_pm/dependencies.dart';
import 'package:recru_task_pm/l10n/l10n.dart';

Future<void> main() async {
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: sl<GoRouter>(),
      theme: themeData,
      darkTheme: themeDataDark,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
