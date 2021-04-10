import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/hour.dart';

class Storage {
  static late Box<dynamic> _box;

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(DailyWeatherAdapter());
    Hive.registerAdapter(HourlyWeatherAdapter());
    Hive.registerAdapter(DayAdapter());
    Hive.registerAdapter(HourAdapter());
    Hive.registerAdapter(TemperatureAdapter());
    Hive.registerAdapter(WeatherAdapter());
  }

  static Future<void> addDailyWeather(DailyWeather dailyWeather) async {
    _box = await Hive.openBox('Weather');
    await _box.put(0, dailyWeather);
    await _box.close();
  }

  static Future<void> addHourlyWeather(HourlyWeather hourlyWeather) async {
    _box = await Hive.openBox('Weather');
    await _box.put(5, hourlyWeather);
    await _box.close();
  }

  static Future<DailyWeather> getDailyWeather() async {
    _box = await Hive.openBox('Weather');
    final dailyWeather = await _box.get(0);
    await _box.close();
    return dailyWeather;
  }

  static Future<HourlyWeather> getHourlyWeather() async {
    _box = await Hive.openBox('Weather');
    final hourlyWeather = await _box.get(5);
    await _box.close();
    return hourlyWeather;
  }

  static Future<void> deleteDailyWeather() async {
    _box = await Hive.openBox('Weather');
    await _box.delete(0);
    await _box.close();
  }

  static Future<void> deleteHourlyWeather() async {
    _box = await Hive.openBox('Weather');
    await _box.delete(5);
    await _box.close();
  }

  static Future<void> clear() async {
    _box = await Hive.openBox('Weather');
    await _box.clear();
    await _box.close();
  }
}
