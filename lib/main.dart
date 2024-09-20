// ignore_for_file: unrelated_type_equality_checks
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/change_notifier.dart';
import './router/index.dart';
import 'themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('zh', 'CN'), Locale('en', 'US')],
        fallbackLocale: const Locale('zh', 'CN'),
        path: 'translations',
        child: const MainApp(),
    ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String themeValue = context.watch<Counter>().themeValue;

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: themeValue == 'light' ? AppTheme.lightTheme : AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
