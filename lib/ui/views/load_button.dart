import 'package:flutter/material.dart';

class LoadButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const LoadButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.cloud_download),
    );
  }
}
