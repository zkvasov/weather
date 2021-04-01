// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourAdapter extends TypeAdapter<Hour> {
  @override
  final int typeId = 4;

  @override
  Hour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hour(
      dt: fields[0] as int,
      temp: fields[1] as double,
      pressure: fields[2] as int,
      humidity: fields[3] as int,
      wind_speed: fields[4] as double,
      clouds: fields[6] as int,
    )..weather = (fields[5] as List)?.cast<Weather>();
  }

  @override
  void write(BinaryWriter writer, Hour obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.pressure)
      ..writeByte(3)
      ..write(obj.humidity)
      ..writeByte(4)
      ..write(obj.wind_speed)
      ..writeByte(5)
      ..write(obj.weather)
      ..writeByte(6)
      ..write(obj.clouds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hour _$HourFromJson(Map<String, dynamic> json) {
  return Hour(
    dt: json['dt'] as int,
    temp: (json['temp'] as num)?.toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    wind_speed: (json['wind_speed'] as num)?.toDouble(),
    clouds: json['clouds'] as int,
  )..weather = (json['weather'] as List)
      ?.map(
          (e) => e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.wind_speed,
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
      'clouds': instance.clouds,
    };
