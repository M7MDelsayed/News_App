import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/Core/Style/theme.dart';
import 'package:news_app/Providers/settings_provider.dart';
import 'package:news_app/View/news/news_details.dart';
import 'package:news_app/View/news/search_screen.dart';
import 'package:news_app/View/settings/settings_screen.dart';
import 'package:news_app/View/splash_view.dart';
import 'package:provider/provider.dart';

import 'View/home/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: SplashView.routeName,
      routes: {
        HomeView.routeName: (_) => HomeView(),
        SplashView.routeName: (_) => SplashView(),
        NewsDetails.routeName: (_) => NewsDetails(),
        SearchScreen.routeName: (_) => SearchScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen()
      },
      locale: provider.currentLang,
    );
  }
}
