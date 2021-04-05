import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/service_locator.dart' as di;
import 'package:weather_app/storage.dart';
import 'package:weather_app/models/notification_settings_model.dart';

import 'package:weather_app/localization/app_language.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupNotifications();
  await Storage.init();
  await Firebase.initializeApp();

  di.setup();

  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  runApp(
    ProviderScope(
      child: App(
        appLanguage: appLanguage,
      ),
    ),
  );
}
