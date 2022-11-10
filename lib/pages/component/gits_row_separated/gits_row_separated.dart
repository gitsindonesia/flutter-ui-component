import 'dart:math' as math;

import 'package:flutter/material.dart';

class GitsRowSeparated extends StatelessWidget {
  const GitsRowSeparated({
    Key? key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection,
    this.textBaseline,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      textDirection: textDirection,
      children: List.generate(
        math.max(0, itemCount * 2 - 1),
        (index) {
          final int itemIndex = index ~/ 2;
          if (index.isEven) {
            return itemBuilder(context, itemIndex);
          }
          return separatorBuilder(context, itemIndex ~/ 2);
        },
      ),
    );
  }
}
