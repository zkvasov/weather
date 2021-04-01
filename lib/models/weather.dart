import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Weather {
  @HiveField(0)
  String main;
  @HiveField(1)
  String description;
  @HiveField(2)
  String icon;

  Weather({this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}