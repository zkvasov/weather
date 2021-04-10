import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/notifiers/hourly_weather_notifier.dart';
import 'package:weather_app/ui/views/full_hour_description.dart';
import 'package:weather_app/ui/views/load_button.dart';
import 'package:weather_app/localization/app_localizations.dart';

final hourlyWeatherProvider = StateNotifierProvider(
  (ref) => HourlyWeatherNotifier()..loadDataFromHive(),
);

class HourlyWeatherPage extends HookWidget {
  const HourlyWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hourlyWeather = useProvider(hourlyWeatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('hourly_weather'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: LoadButton(
        onPressed: context.read(hourlyWeatherProvider.notifier).loadDataFromApi,
      ),
      body: hourlyWeather == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FullHourDescription(
              hourlyWeather: hourlyWeather,
            ),
    );
  }
}
