import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/notifiers/notification_settings_notifier.dart';
import 'package:weather_app/utils/date_utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final notificationSettingsProvider =
    StateNotifierProvider((ref) => NotificationSettingsNotifier());

class NotificationSettingsPage extends HookWidget {
  const NotificationSettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationSettingsModel = useProvider(
      notificationSettingsProvider.state,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      notificationSettingsModel.selectedDateTime == null
                          ? CircularProgressIndicator()
                          : Text(
                              notificationSettingsModel.selectedDateTime
                                  .getFormattedFullDateTimeString(),
                            ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () => context
                            .read(notificationSettingsProvider)
                            .selectDate(context),
                        child: Text('Select date'),
                      ),
                    ],
                  ),
                ),
                PaddedElevatedButton(
                  buttonText: 'Create notification by selected date and time',
                  onPressed: notificationSettingsModel.selectedDateTime == null
                      ? null
                      : () async {
                          await notificationSettingsModel
                              .scheduleDailyNotification();
                        },
                ),
                PaddedElevatedButton(
                  buttonText: 'Cancel all notifications',
                  onPressed: () async {
                    await notificationSettingsModel.cancelAllNotifications();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaddedElevatedButton extends StatelessWidget {
  const PaddedElevatedButton({
    this.buttonText,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}
