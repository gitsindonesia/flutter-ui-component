import 'package:flutter/material.dart';

class GitsTextScaleDown extends StatelessWidget {
  const GitsTextScaleDown(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.style,
    this.fit = FlexFit.loose,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final TextStyle? style;
  final FlexFit fit;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: fit,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
