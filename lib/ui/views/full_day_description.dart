import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/ui/views/image_text_column.dart';
import 'package:weather_app/ui/views/short_day_description.dart';
import 'package:weather_app/ui/views/weather_temp_row.dart';

class FullDayDescription extends StatelessWidget {
  final DailyWeather dailyWeather;

  const FullDayDescription({Key key, this.dailyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dailyWeather?.daily?.length ?? 0,
      itemBuilder: (context, index) {
        final currentWeather = dailyWeather.daily[index];
        return ExpansionTile(
          title: ShortDayDescription(
            dt: currentWeather.dt,
            iconName: currentWeather.weather[0].icon,
            minTemp: currentWeather.temp.min,
            maxTemp: currentWeather.temp.max,
          ),
          children: <Widget>[
            ListTile(
              title: Column(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  WeatherTempRow(
                    iconName: currentWeather.weather[0].icon,
                    descriptionWeather: currentWeather.weather[0].description,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      ImageTextColumn(
                        imageAssetPath: "assets/images/morning.png",
                        temp: currentWeather.temp.morn,
                      ),
                      ImageTextColumn(
                        imageAssetPath: "assets/images/day.png",
                        temp: currentWeather.temp.day,
                      ),
                      ImageTextColumn(
                        imageAssetPath: "assets/images/evening.png",
                        temp: currentWeather.temp.eve,
                      ),
                      ImageTextColumn(
                        imageAssetPath: "assets/images/night.png",
                        temp: currentWeather.temp.night,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Text('pressure: ${currentWeather.pressure} mmHg'),
                        Text('clouds: ${currentWeather.clouds} %'),
                        Text('wind speed: ${currentWeather.wind_speed} m/s'),
                        Text('humidity: ${currentWeather.humidity} %'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
