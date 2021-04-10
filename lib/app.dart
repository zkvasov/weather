import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/pages/splash_page.dart';
import 'package:weather_app/localization/app_localizations.dart';
import 'package:weather_app/localization/app_language.dart';

class App extends StatelessWidget {
  final AppLanguage appLanguage;

  App({required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            locale: model.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ru', ''),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: SplashPage(),
          );
        },
      ),
    );
  }
}
