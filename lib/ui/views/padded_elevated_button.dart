import 'package:flutter/material.dart';

class PaddedElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const PaddedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
