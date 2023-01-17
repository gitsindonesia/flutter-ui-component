import 'package:flutter/material.dart';

class GitsTextScaleDown extends StatelessWidget {
  const GitsTextScaleDown(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text, style: style),
    );
  }
}
