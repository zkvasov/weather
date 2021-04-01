import 'package:get_it/get_it.dart';
import 'package:weather_app/data/rest_client.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/storage.dart';

class DailyWeatherNotifier extends StateNotifier<DailyWeather> {
  DailyWeatherNotifier() : super(null);

  Future<void> loadData() async {
    var client = GetIt.instance<RestClient>();
    final dailyWeather = await client.getDailyWeather();
    log(dailyWeather.toJson().toString());

    await Storage.clear();
    await Storage.addDailyWeather(dailyWeather);

    final dailyWeatherFromHive = await Storage.getDailyWeather();
    log(dailyWeatherFromHive.toJson().toString());
    
    state = dailyWeatherFromHive;
  }
}