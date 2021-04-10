import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app/localization/app_localizations.dart';
import 'package:weather_app/notifiers/daily_weather_notifier.dart';
import 'package:weather_app/ui/views/full_day_description.dart';
import 'package:weather_app/ui/views/load_button.dart';
import 'package:weather_app/ui/views/menu_button.dart';

final dailyWeatherProvider = StateNotifierProvider(
  (ref) => DailyWeatherNotifier()..loadDataFromHive(),
);

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dailyWeather = useProvider(dailyWeatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('weather'),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          MenuButton(),
        ],
      ),
      floatingActionButton: LoadButton(
        onPressed: context.read(dailyWeatherProvider.notifier).loadDataFromApi,
      ),
      body: dailyWeather == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FullDayDescription(dailyWeather: dailyWeather),
    );
  }
}
