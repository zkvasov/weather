import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather.dart';

part 'day.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class Day {
  @HiveField(0)
  int dt;
  @HiveField(1)
  int sunrise;
  @HiveField(2)
  int sunset;
  @HiveField(3)
  Temperature temp;
  @HiveField(4)
  int pressure;
  @HiveField(5)
  int humidity;
  @HiveField(6)
  double wind_speed;
  @HiveField(7)
  List<Weather> weather;
  @HiveField(8)
  int clouds;

  Day({this.dt, this.sunrise, this.sunset, this.pressure, this.humidity,
  this.wind_speed, this.clouds});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}