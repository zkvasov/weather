import 'package:flutter/material.dart';
import 'package:weather_app/localization/app_localizations.dart';
import 'package:weather_app/ui/pages/hourly_weather_page.dart';
import 'package:weather_app/ui/pages/notification_settings_page.dart';
import 'package:weather_app/constants.dart';

class MenuButton extends StatelessWidget{

  void _menuChoiceAction(BuildContext context, String choice) {
    if (choice == Constants.notificationSettings) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NotificationSettingsPage(),
        ),
      );
    }
    if (choice == Constants.hourlyWeather) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HourlyWeatherPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return PopupMenuButton<String>(
      onSelected: (choice) => _menuChoiceAction(context, choice),
      itemBuilder: (BuildContext context) {
        return Constants.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              AppLocalizations.of(context).translate(choice),
            ),
          );
        }).toList();
      },
    );
  }
}