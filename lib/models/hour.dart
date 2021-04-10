import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/weather.dart';

part 'hour.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(explicitToJson: true)
class Hour {
  @HiveField(0)
  final int dt;
  @HiveField(1)
  final double temp;
  @HiveField(2)
  final int pressure;
  @HiveField(3)
  final int humidity;
  @HiveField(4)
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @HiveField(5)
  final List<Weather> weather;
  @HiveField(6)
  final int clouds;

  Hour({
    required this.dt,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
    required this.clouds,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
