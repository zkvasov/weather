import 'package:flutter/material.dart';

class LoadButton extends StatelessWidget{
  const LoadButton({Key key, this.onPressed}) : super(key: key);
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.cloud_download),
    );
  }
}