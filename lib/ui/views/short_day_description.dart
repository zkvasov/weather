import 'package:flutter/cupertino.dart';
import 'package:weather_app/utils/date_utils.dart';

class ShortDayDescription extends StatelessWidget {
  final int dt;
  final String iconName;
  final double minTemp;
  final double maxTemp;

  const ShortDayDescription(
      {Key key, this.dt, this.iconName, this.minTemp, this.maxTemp})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Text(
          DateTime.fromMillisecondsSinceEpoch(
            dt * 1000,
          ).getMonthDayString(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Image.network("https://openweathermap.org/img/wn/$iconName@2x.png"),
        Text(
          '${minTemp.toStringAsFixed(1)}'
          '...${maxTemp.toStringAsFixed(1)}°C',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}