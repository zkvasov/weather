import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Weather {
  @HiveField(0)
  final String main;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String icon;

  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
