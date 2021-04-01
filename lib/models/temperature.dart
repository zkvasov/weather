import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Temperature {
  @HiveField(0)
  double day;
  @HiveField(1)
  double min;
  @HiveField(2)
  double max;
  @HiveField(3)
  double night;
  @HiveField(4)
  double eve;
  @HiveField(5)
  double morn;


  Temperature({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}