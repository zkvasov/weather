import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/hour.dart';

part 'hourly_weather.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(explicitToJson: true)
class HourlyWeather {
  @HiveField(0)
  final String timezone;
  @HiveField(1)
  final List<Hour> hourly;

  HourlyWeather({
    required this.timezone,
    required this.hourly,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherToJson(this);
}
