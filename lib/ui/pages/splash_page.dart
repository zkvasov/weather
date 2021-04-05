import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                "assets/images/morning.png",
                width: MediaQuery.of(context).size.width / 4
            ),
            Text("Weather")
          ],
        ),
      ),
    );
  }

}