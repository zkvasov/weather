import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app/notifiers/daily_weather_notifier.dart';
import 'package:weather_app/ui/pages/hourly_weather_page.dart';
import 'package:weather_app/utils/date_utils.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/ui/pages/notification_settings_page.dart';

final dailyWeatherProvider = StateNotifierProvider(
  (ref) => DailyWeatherNotifier()..loadData(),
);

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  void _menuChoiceAction(BuildContext context, String choice) {
    if (choice == Constants.notificationSettings) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NotificationSettingsPage(),
        ),
      );
    }
    if (choice == Constants.hourlyWeather) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HourlyWeatherPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //di.setup();

    final dailyWeather = useProvider(dailyWeatherProvider.state);
    //context.read(dailyWeatherProvider).loadData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (choice) => _menuChoiceAction(context, choice),
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read(dailyWeatherProvider).loadData,
        child: Icon(Icons.cloud_download),
      ),
      body: dailyWeather == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(dailyWeather),
    );
  }

  Widget _buildBody(DailyWeather dailyWeather) {
    return ListView.builder(
      itemCount: dailyWeather?.daily?.length ?? 0,
      itemBuilder: (context, index) {
        final currentWeather = dailyWeather.daily[index];
        return ExpansionTile(
          title: Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Text(
                DateTime.fromMillisecondsSinceEpoch(
                  currentWeather.dt * 1000,
                ).getMonthDayString(),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Image.network(
                  "https://openweathermap.org/img/wn/${currentWeather.weather[0].icon}@2x.png"),
              Text(
                '${currentWeather.temp.min.toStringAsFixed(1)}'
                '...${currentWeather.temp.max.toStringAsFixed(1)}°C',
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
                  Row(
                    //temperature
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Column(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/morning.png",
                            width: (MediaQuery.of(context).size.width - 32) / 4,
                          ),
                          Text('${currentWeather.temp.morn}°C')
                        ],
                      ),
                      Column(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/day.png",
                            width: (MediaQuery.of(context).size.width - 32) / 4,
                          ),
                          Text('${currentWeather.temp.day}°C')
                        ],
                      ),
                      Column(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/evening.png",
                            width: (MediaQuery.of(context).size.width - 32) / 4,
                          ),
                          Text('${currentWeather.temp.eve}°C')
                        ],
                      ),
                      Column(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/night.png",
                            width: (MediaQuery.of(context).size.width - 32) / 4,
                          ),
                          Text('${currentWeather.temp.night}°C')
                        ],
                      ),
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
              ),
            ),
          ],
        );
      },
    );
  }
}
