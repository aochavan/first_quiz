import 'package:flutter/material.dart';

// Variable declaration

class StyledText extends StatelessWidget {
  const StyledText(this.customWelcomeText, this.colorText, this.sizeText,
      {super.key});

  final String customWelcomeText;
  final Color colorText;
  final double sizeText;

  @override
  Widget build(context) {
    return Text(
      customWelcomeText,
      style: TextStyle(
        color: colorText,
        fontSize: sizeText,
      ),
    );
  }
}
