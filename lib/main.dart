import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/data/injection_container.dart' as di;
import 'package:weather_app/storage.dart';
import 'models/notification_settings_model.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupNotifications();
  await Storage.init();
  await Firebase.initializeApp();

  di.setup();

  print(await FirebaseMessaging.instance.getToken());

  runApp(
    const ProviderScope(child: App()),
  );
}
