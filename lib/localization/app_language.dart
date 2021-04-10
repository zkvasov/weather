import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class AppLanguage extends ChangeNotifier {
  Locale? _appLocale = Locale('en');

  Locale get appLocal => _appLocale ?? Locale("en");

  Future<void> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
  }

  Future<void> changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ru")) {
      _appLocale = Locale("ru");
      await prefs.setString('language_code', 'ru');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}

AppLanguage getAppLanguage(BuildContext context) {
  return Provider.of<AppLanguage>(context);
}
