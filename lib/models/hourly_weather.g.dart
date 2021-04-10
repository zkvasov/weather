// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyWeatherAdapter extends TypeAdapter<HourlyWeather> {
  @override
  final int typeId = 5;

  @override
  HourlyWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyWeather(
      timezone: fields[0] as String,
      hourly: (fields[1] as List).cast<Hour>(),
    );
  }

  @override
  void write(BinaryWriter writer, HourlyWeather obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timezone)
      ..writeByte(1)
      ..write(obj.hourly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeather _$HourlyWeatherFromJson(Map<String, dynamic> json) {
  return HourlyWeather(
    timezone: json['timezone'] as String,
    hourly: (json['hourly'] as List<dynamic>)
        .map((e) => Hour.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HourlyWeatherToJson(HourlyWeather instance) =>
    <String, dynamic>{
      'timezone': instance.timezone,
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
    };
