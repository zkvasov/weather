import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Temperature {
  @HiveField(0)
  final double day;
  @HiveField(1)
  final double min;
  @HiveField(2)
  final double max;
  @HiveField(3)
  final double night;
  @HiveField(4)
  final double eve;
  @HiveField(5)
  final double morn;

  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
