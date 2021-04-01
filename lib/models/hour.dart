import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/weather.dart';

part 'hour.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(explicitToJson: true)
class Hour {
  @HiveField(0)
  int dt;
  @HiveField(1)
  double temp;
  @HiveField(2)
  int pressure;
  @HiveField(3)
  int humidity;
  @HiveField(4)
  double wind_speed;
  @HiveField(5)
  List<Weather> weather;
  @HiveField(6)
  int clouds;

  Hour({this.dt, this.temp, this.pressure,
    this.humidity, this.wind_speed, this.clouds});

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);
  Map<String, dynamic> toJson() => _$HourToJson(this);
}