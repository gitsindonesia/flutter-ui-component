import 'package:flutter/material.dart';

class GitsSpacing extends StatelessWidget {
  const GitsSpacing.vertical({
    Key? key,
    required this.size,
  })  : axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical4({Key? key})
      : size = 4,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical8({Key? key})
      : size = 8,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical12({Key? key})
      : size = 12,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical16({Key? key})
      : size = 16,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical20({Key? key})
      : size = 20,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical24({Key? key})
      : size = 24,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical28({Key? key})
      : size = 28,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical32({Key? key})
      : size = 32,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical36({Key? key})
      : size = 36,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical40({Key? key})
      : size = 40,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical44({Key? key})
      : size = 44,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical48({Key? key})
      : size = 48,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical52({Key? key})
      : size = 52,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical56({Key? key})
      : size = 56,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical60({Key? key})
      : size = 60,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical64({Key? key})
      : size = 64,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical68({Key? key})
      : size = 68,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical72({Key? key})
      : size = 72,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical76({Key? key})
      : size = 76,
        axis = Axis.vertical,
        super(key: key);
  const GitsSpacing.vertical80({Key? key})
      : size = 80,
        axis = Axis.vertical,
        super(key: key);

  const GitsSpacing.horizontal({
    Key? key,
    required this.size,
  })  : axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal4({Key? key})
      : size = 4,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal8({Key? key})
      : size = 8,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal12({Key? key})
      : size = 12,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal16({Key? key})
      : size = 16,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal20({Key? key})
      : size = 20,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal24({Key? key})
      : size = 24,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal28({Key? key})
      : size = 28,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal32({Key? key})
      : size = 32,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal36({Key? key})
      : size = 36,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal40({Key? key})
      : size = 40,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal44({Key? key})
      : size = 44,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal48({Key? key})
      : size = 48,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal52({Key? key})
      : size = 52,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal56({Key? key})
      : size = 56,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal60({Key? key})
      : size = 60,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal64({Key? key})
      : size = 64,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal68({Key? key})
      : size = 68,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal72({Key? key})
      : size = 72,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal76({Key? key})
      : size = 76,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSpacing.horizontal80({Key? key})
      : size = 80,
        axis = Axis.horizontal,
        super(key: key);

  final double size;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? SizedBox(width: size)
        : SizedBox(height: size);
  }
}
