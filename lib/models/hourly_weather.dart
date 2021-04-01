import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/hour.dart';

part 'hourly_weather.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(explicitToJson: true)
class HourlyWeather {
  @HiveField(0)
  String timezone;
  @HiveField(1)
  List<Hour> hourly;

  HourlyWeather({this.timezone});

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => _$HourlyWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyWeatherToJson(this);
}