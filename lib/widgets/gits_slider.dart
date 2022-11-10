import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsSlider extends StatelessWidget {
  const GitsSlider({
    Key? key,
    required this.title,
    required this.value,
    required this.max,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final double value;
  final double max;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          children: [
            Expanded(
              child: Slider(
                label: value.round().toString(),
                value: value,
                max: max,
                onChanged: onChanged,
              ),
            ),
            const GitsSpacing.horizontal8(),
            Text(value.round().toString()),
          ],
        ),
      ],
    );
  }
}
