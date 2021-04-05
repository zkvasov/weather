import 'package:get_it/get_it.dart';
import 'package:weather_app/api/rest_client.dart';
import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/geolocation_service.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/storage.dart';

class HourlyWeatherNotifier extends StateNotifier<HourlyWeather> {
  HourlyWeatherNotifier() : super(null);

  Future<void> loadDataFromHive() async{
    final hourlyWeatherFromHive = await Storage.getHourlyWeather();
    if(hourlyWeatherFromHive != null){
      log('from Hive:' + hourlyWeatherFromHive.toJson().toString());
      state = hourlyWeatherFromHive;
    }
    else{
      loadDataFromApi();
    }
  }

  Future<void> loadDataFromApi() async {
    var client = GetIt.instance<RestClient>();
    var hourlyWeather;
    try{
      final position = await determinePosition();
      log('geolocation: ' + position.toString());
      hourlyWeather = await client.getHourlyWeather(
        latitude: position.latitude,
        longitude: position.longitude
      );
    }catch(e){
      hourlyWeather = await client.getHourlyWeather();
    }

    log('from Api:' + hourlyWeather.toJson().toString());

    await Storage.deleteHourlyWeather();
    await Storage.addHourlyWeather(hourlyWeather);

    state = hourlyWeather;
  }
}