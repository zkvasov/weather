import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app/localization/app_language.dart';
import 'package:weather_app/localization/app_localizations.dart';
import 'package:weather_app/ui/views/padded_elevated_button.dart';
import 'package:weather_app/notifiers/notification_settings_notifier.dart';
import 'package:weather_app/models/notification_settings_model.dart';
import 'package:weather_app/utils/date_utils.dart';

final notificationSettingsProvider = StateNotifierProvider(
  (ref) => NotificationSettingsNotifier(),
);

class NotificationSettingsPage extends HookWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationSettingsModel =
        useProvider(notificationSettingsProvider) as NotificationSettingsModel;

    var appLanguage = getAppLanguage(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('notification_settings'),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      notificationSettingsModel.selectedDateTime == null
                          ? CircularProgressIndicator()
                          : Text(
                              notificationSettingsModel.selectedDateTime!
                                  .getFormattedFullDateTimeString(),
                            ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () => context
                            .read(notificationSettingsProvider.notifier)
                            .selectDate(context),
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('select_date_time'),
                        ),
                      ),
                    ],
                  ),
                ),
                PaddedElevatedButton(
                  buttonText: AppLocalizations.of(context)
                      .translate('create_notification'),
                  onPressed: notificationSettingsModel.selectedDateTime == null
                      ? null
                      : () async {
                          await notificationSettingsModel
                              .scheduleDailyNotification();
                        },
                ),
                PaddedElevatedButton(
                  buttonText: AppLocalizations.of(context)
                      .translate('cancel_all_notifications'),
                  onPressed: () async {
                    await notificationSettingsModel.cancelAllNotifications();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        appLanguage.changeLanguage(Locale("en"));
                      },
                      child: Text('English'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        appLanguage.changeLanguage(Locale("ru"));
                      },
                      child: Text('Русский'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
