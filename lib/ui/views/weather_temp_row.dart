import 'package:flutter/material.dart';

class WeatherTempRow extends StatelessWidget{

  final String iconName;
  final String descriptionWeather;

  const WeatherTempRow({Key key, this.iconName, this.descriptionWeather}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
            "https://openweathermap.org/img/wn/$iconName@2x.png"),
        Text(descriptionWeather),
      ],
    );
  }
}