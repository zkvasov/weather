import 'package:flutter/material.dart';
import 'package:weather_app/localization/app_localizations.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/ui/views/short_hour_description.dart';
import 'package:weather_app/ui/views/weather_temp_row.dart';

class FullHourDescription extends StatelessWidget {
  final HourlyWeather hourlyWeather;

  const FullHourDescription({Key key, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hourlyWeather?.hourly?.length ?? 0,
      itemBuilder: (context, index) {
        final currentWeather = hourlyWeather.hourly[index];
        return ExpansionTile(
          title: ShortHourDescription(
            dt: currentWeather.dt,
            iconWeatherName: currentWeather.weather[0].icon,
            temp: currentWeather.temp,
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
                Column(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '${AppLocalizations.of(context).translate('pressure')}: ${currentWeather.pressure} ${AppLocalizations.of(context).translate('mm_hg')}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '${AppLocalizations.of(context).translate('clouds')}: ${currentWeather.clouds} %'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '${AppLocalizations.of(context).translate('wind_speed')}: ${currentWeather.wind_speed} ${AppLocalizations.of(context).translate('meter_per_sec')}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        '${AppLocalizations.of(context).translate('humidity')}: ${currentWeather.humidity} %'),
                  ],
                ),
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
