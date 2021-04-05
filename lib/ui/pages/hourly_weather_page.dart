import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/notifiers/hourly_weather_notifier.dart';
import 'package:weather_app/ui/views/full_hour_description.dart';
import 'package:weather_app/ui/views/load_button.dart';

final hourlyWeatherProvider = StateNotifierProvider(
  (ref) => HourlyWeatherNotifier()..loadDataFromHive(),
);

class HourlyWeatherPage extends HookWidget {
  const HourlyWeatherPage({Key key}) : super(key: key);

  Widget _buildBody(HourlyWeather hourlyWeather) {
    return FullHourDescription(hourlyWeather: hourlyWeather,);
  }

  @override
  Widget build(BuildContext context) {
    final hourlyWeather = useProvider(hourlyWeatherProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('HourlyWeather'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: LoadButton(
        onPressed: context.read(hourlyWeatherProvider).loadDataFromApi,
      ),
      body: hourlyWeather == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(hourlyWeather),
    );
  }
}
