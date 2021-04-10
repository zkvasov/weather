import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/day.dart';

part 'daily_weather.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class DailyWeather {
  @HiveField(0)
  final String timezone;
  @HiveField(1)
  final List<Day> daily;

  DailyWeather({
    required this.timezone,
    required this.daily,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}
