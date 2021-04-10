// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 1;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      dt: fields[0] as int,
      sunrise: fields[1] as int,
      sunset: fields[2] as int,
      temp: fields[3] as Temperature,
      pressure: fields[4] as int,
      humidity: fields[5] as int,
      windSpeed: fields[6] as double,
      weather: (fields[7] as List).cast<Weather>(),
      clouds: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.pressure)
      ..writeByte(5)
      ..write(obj.humidity)
      ..writeByte(6)
      ..write(obj.windSpeed)
      ..writeByte(7)
      ..write(obj.weather)
      ..writeByte(8)
      ..write(obj.clouds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) {
  return Day(
    dt: json['dt'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
    temp: Temperature.fromJson(json['temp'] as Map<String, dynamic>),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    windSpeed: (json['wind_speed'] as num).toDouble(),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    clouds: json['clouds'] as int,
  );
}

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'clouds': instance.clouds,
    };
