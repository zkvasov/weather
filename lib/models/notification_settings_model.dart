import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_app/models/recieved_notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

const MethodChannel platform = MethodChannel('com.example/weather_app');

String? selectedNotificationPayload;

class NotificationSettingsModel {
  final DateTime? selectedDateTime;

  const NotificationSettingsModel(this.selectedDateTime);

  Future<void> scheduleDailyNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Weather',
      'Check the weather forecast before going outside',
      _nextInstanceOfSelectedTime(selectedDateTime!),
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily notification channel id',
            'daily notification channel name',
            'daily notification description'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOfSelectedTime(DateTime dateTime) {
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, dateTime.year,
        dateTime.month, dateTime.day, dateTime.hour, dateTime.minute,);
    if (scheduledDate.isBefore(dateTime)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

Future<void> setupNotifications() async {
  await _configureLocalTimeZone();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    selectedNotificationPayload = payload!;
    selectNotificationSubject.add(payload);
  });
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String timeZoneName =
      (await platform.invokeMethod<String>('getTimeZoneName'))!;
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

void dispose() {
  didReceiveLocalNotificationSubject.close();
  selectNotificationSubject.close();
}
