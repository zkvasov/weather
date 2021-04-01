import 'package:get_it/get_it.dart';
import 'package:weather_app/data/rest_client.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/storage.dart';

class HourlyWeatherNotifier extends StateNotifier<HourlyWeather> {
  HourlyWeatherNotifier() : super(null);

  Future<void> loadData() async {
    var client = GetIt.instance<RestClient>();
    final hourlyWeather = await client.getHourlyWeather();
    log(hourlyWeather.toJson().toString());

    await Storage.clear();
    await Storage.addHourlyWeather(hourlyWeather);

    final hourlyWeatherFromHive = await Storage.getHourlyWeather();
    log(hourlyWeatherFromHive.toJson().toString());

    state = hourlyWeatherFromHive;
  }
}