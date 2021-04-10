import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather.dart';

part 'day.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class Day {
  @HiveField(0)
  final int dt;
  @HiveField(1)
  final int sunrise;
  @HiveField(2)
  final int sunset;
  @HiveField(3)
  final Temperature temp;
  @HiveField(4)
  final int pressure;
  @HiveField(5)
  final int humidity;
  @HiveField(6)
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @HiveField(7)
  final List<Weather> weather;
  @HiveField(8)
  final int clouds;

  Day({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
    required this.clouds,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
