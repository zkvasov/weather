import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/temperature.dart';

part 'daily_weather.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class DailyWeather {
  @HiveField(0)
  String timezone;
  @HiveField(1)
  List<Day> daily;

  DailyWeather({this.timezone});

  factory DailyWeather.fromJson(Map<String, dynamic> json) => _$DailyWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}