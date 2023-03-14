import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;

  BottomButton({@required this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 72,
        width: double.infinity,
        color: const Color(0xFFD83557),
        child: Center(
          child: Text(
            '$buttonText'.toUpperCase(),
            style: const TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
