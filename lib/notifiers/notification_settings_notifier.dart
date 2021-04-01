
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/models/notification_settings_model.dart';

class NotificationSettingsNotifier extends StateNotifier<NotificationSettingsModel>{
  NotificationSettingsNotifier() : super(_initialValue);
  static const _initialValue = NotificationSettingsModel(null);

  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(2101));


    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },);

    var pickedDateTime = new DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute
    );
    if (pickedDate != null || pickedTime != null)
      state = NotificationSettingsModel(pickedDateTime);
  }

}