import 'package:get_it/get_it.dart';
import 'package:weather_app/api/rest_client.dart';
import 'package:weather_app/geolocation_service.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/storage.dart';

class DailyWeatherNotifier extends StateNotifier<DailyWeather?> {
  DailyWeatherNotifier() : super(null);

  Future<void> loadDataFromHive() async {
    final dailyWeatherFromHive;
    dailyWeatherFromHive = await Storage.getDailyWeather();
    if (dailyWeatherFromHive != null) {
      log('from Hive:' + dailyWeatherFromHive.toJson().toString());
      state = dailyWeatherFromHive;
    } else {
      loadDataFromApi();
    }
  }

  Future<void> loadDataFromApi() async {
    final client = GetIt.instance<RestClient>();
    var dailyWeather;
    try {
      final position = await determinePosition();
      log('geolocation: ' + position.toString());
      dailyWeather = await client.getDailyWeather(
          latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      dailyWeather = await client.getDailyWeather();
    }
    log('from Api:' + dailyWeather.toJson().toString());

    await Storage.deleteDailyWeather();
    await Storage.addDailyWeather(dailyWeather);

    state = dailyWeather;
  }
}
