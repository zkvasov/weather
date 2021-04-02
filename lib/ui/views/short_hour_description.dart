import 'package:flutter/cupertino.dart';
import 'package:weather_app/utils/date_utils.dart';

class ShortHourDescription extends StatelessWidget {
  final int dt;
  final String iconWeatherName;
  final double temp;

  const ShortHourDescription(
      {Key key, this.dt, this.iconWeatherName, this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Text(
          DateTime.fromMillisecondsSinceEpoch(
            dt * 1000,
          ).getMonthDayTimeString(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Image.network(
            "https://openweathermap.org/img/wn/$iconWeatherName@2x.png"),
        Text(
          '${temp.toStringAsFixed(1)}°C',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
