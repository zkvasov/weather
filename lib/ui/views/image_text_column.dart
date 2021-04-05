import 'package:flutter/material.dart';

class ImageTextColumn extends StatelessWidget{

  final String imageAssetPath;
  final double temp;

  const ImageTextColumn({Key key, this.imageAssetPath, this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Image.asset(
          imageAssetPath,
          width: (MediaQuery.of(context).size.width - 32) / 4,
        ),
        SizedBox(
          height: 15,
        ),
        Text('$temp °C'),
      ],
    );
  }
}