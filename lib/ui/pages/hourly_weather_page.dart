import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/notifiers/hourly_weather_notifier.dart';
import 'package:weather_app/utils/date_utils.dart';

final hourlyWeatherProvider = StateNotifierProvider(
  (ref) => HourlyWeatherNotifier()..loadData(),
);

class HourlyWeatherPage extends HookWidget {
  const HourlyWeatherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hourlyWeather = useProvider(hourlyWeatherProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('HourlyWeather'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read(hourlyWeatherProvider).loadData,
        child: Icon(Icons.cloud_download),
      ),
      body: hourlyWeather == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(hourlyWeather),
    );
  }

  Widget _buildBody(HourlyWeather dailyWeather) {
    return ListView.builder(
      itemCount: dailyWeather?.hourly?.length ?? 0,
      itemBuilder: (context, index) {
        final currentWeather = dailyWeather.hourly[index];
        return ExpansionTile(
          title: Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Text(
                DateTime.fromMillisecondsSinceEpoch(
                  currentWeather.dt * 1000,
                ).getMonthDayTimeString(),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Image.network(
                  "https://openweathermap.org/img/wn/${currentWeather.weather[0].icon}@2x.png"),
              Text(
                '${currentWeather.temp.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          children: <Widget>[
            ListTile(
                title: Column(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Row(
                  //weather
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                        "https://openweathermap.org/img/wn/${currentWeather.weather[0].icon}@2x.png"),
                    Text('${currentWeather.weather[0].description}')
                  ],
                ),
                Column(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Text('pressure: ${currentWeather.pressure} mmHg'),
                    Text('clouds: ${currentWeather.clouds} %'),
                    Text('wind speed: ${currentWeather.wind_speed} m/s'),
                    Text('humidity: ${currentWeather.humidity} %'),
                  ],
                )
              ],
            )
                //title: Text('${currentWeather.temp.day}'),
                ),
          ],
        );
      },
    );
  }
}
