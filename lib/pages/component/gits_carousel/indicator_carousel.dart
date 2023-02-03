import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';

class IndicatorCarousel extends StatelessWidget {
  const IndicatorCarousel({
    super.key,
    required this.length,
    required this.selected,
    required this.onTap,
  });

  final int length;
  final int selected;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        length,
        (index) => InkWell(
          onTap: () => onTap(index),
          child: Container(
            key: Key('dot$index'),
            margin: const EdgeInsets.all(GitsSizes.s4),
            width: index == selected ? GitsSizes.s24 : GitsSizes.s8,
            height: GitsSizes.s8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(GitsSizes.s80),
              color: index == selected ? Colors.black : Colors.grey,
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}
