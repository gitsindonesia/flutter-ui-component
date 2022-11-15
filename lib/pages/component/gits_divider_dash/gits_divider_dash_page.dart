import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_divider_dash/gits_divider_dash.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_slider.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';

class GitsDividerDashPage extends StatelessWidget {
  const GitsDividerDashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Divider Dash')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsDividerDash,
          child: Column(
            children: const [
              ShortDescription(
                title: 'GitsDividerDash',
                description: 'Component divider with dash',
              ),
            ],
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsDividerDashHorizontal,
          builder: (context) => const ExampleGitsDividerDashHorizontal(),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsDividerDashVertical,
          builder: (context) => const ExampleGitsDividerDashVertical(),
        ),
      ],
    );
  }
}

class ExampleGitsDividerDashHorizontal extends StatefulWidget {
  const ExampleGitsDividerDashHorizontal({super.key});

  @override
  State<ExampleGitsDividerDashHorizontal> createState() =>
      _ExampleGitsDividerDashHorizontalState();
}

class _ExampleGitsDividerDashHorizontalState
    extends State<ExampleGitsDividerDashHorizontal> {
  double thickness = 2;
  double dashWidth = 4;
  double dashGap = 12;
  StrokeCap strokeCap = StrokeCap.square;
  String selectedColor = 'grey';
  Map<String, Color> colors = {
    'grey': Colors.grey,
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'black': Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Horizontal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('default'),
            const GitsSpacing.vertical8(),
            const GitsDividerDash(),
            const GitsSpacing.vertical16(),
            const Text('custom dash'),
            const GitsSpacing.vertical8(),
            GitsSlider(
              title: 'thickness',
              value: thickness,
              max: 10,
              onChanged: (value) => setState(() {
                thickness = value;
              }),
            ),
            GitsSlider(
              title: 'dash width',
              value: dashWidth,
              max: 10,
              onChanged: (value) => setState(() {
                dashWidth = value;
              }),
            ),
            GitsSlider(
              title: 'dash gap',
              value: dashGap,
              max: 30,
              onChanged: (value) => setState(() {
                dashGap = value;
              }),
            ),
            CardProperties(
              title: 'StrokeCap',
              selected: strokeCap.name,
              items: StrokeCap.values.map((e) => e.name).toList(),
              onChanged: (value) => setState(() {
                strokeCap = StrokeCap.values.firstWhere((e) => e.name == value);
              }),
            ),
            const GitsSpacing.vertical16(),
            CardProperties(
              title: 'Color',
              selected: selectedColor,
              items: colors.keys.toList(),
              onChanged: (value) => setState(() {
                selectedColor = value;
              }),
            ),
            const GitsSpacing.vertical16(),
            GitsDividerDash(
              thickness: thickness,
              dashWidth: dashWidth,
              dashGap: dashGap,
              strokeCap: strokeCap,
              color: colors[selectedColor],
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleGitsDividerDashVertical extends StatefulWidget {
  const ExampleGitsDividerDashVertical({super.key});

  @override
  State<ExampleGitsDividerDashVertical> createState() =>
      _ExampleGitsDividerDashVerticalState();
}

class _ExampleGitsDividerDashVerticalState
    extends State<ExampleGitsDividerDashVertical> {
  double thickness = 2;
  double dashWidth = 4;
  double dashGap = 12;
  StrokeCap strokeCap = StrokeCap.square;
  String selectedColor = 'grey';
  Map<String, Color> colors = {
    'grey': Colors.grey,
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'black': Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Vertical')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RotatedBox(
              quarterTurns: 1,
              child: Text('default'),
            ),
            const GitsSpacing.horizontal8(),
            const GitsDividerDash(axis: Axis.vertical),
            const GitsSpacing.horizontal8(),
            const RotatedBox(
              quarterTurns: 1,
              child: Text('custom dash'),
            ),
            const GitsSpacing.horizontal8(),
            RotatedBox(
              quarterTurns: 1,
              child: GitsSlider(
                title: 'thickness',
                value: thickness,
                max: 10,
                onChanged: (value) => setState(() {
                  thickness = value;
                }),
              ),
            ),
            RotatedBox(
              quarterTurns: 1,
              child: GitsSlider(
                title: 'dash width',
                value: dashWidth,
                max: 10,
                onChanged: (value) => setState(() {
                  dashWidth = value;
                }),
              ),
            ),
            RotatedBox(
              quarterTurns: 1,
              child: GitsSlider(
                title: 'dash gap',
                value: dashGap,
                max: 30,
                onChanged: (value) => setState(() {
                  dashGap = value;
                }),
              ),
            ),
            RotatedBox(
              quarterTurns: 1,
              child: CardProperties(
                title: 'StrokeCap',
                selected: strokeCap.name,
                items: StrokeCap.values.map((e) => e.name).toList(),
                onChanged: (value) => setState(() {
                  strokeCap =
                      StrokeCap.values.firstWhere((e) => e.name == value);
                }),
              ),
            ),
            const GitsSpacing.horizontal16(),
            RotatedBox(
              quarterTurns: 1,
              child: CardProperties(
                title: 'Color',
                selected: selectedColor,
                items: colors.keys.toList(),
                onChanged: (value) => setState(() {
                  selectedColor = value;
                }),
              ),
            ),
            const GitsSpacing.horizontal16(),
            GitsDividerDash(
              axis: Axis.vertical,
              thickness: thickness,
              dashWidth: dashWidth,
              dashGap: dashGap,
              strokeCap: strokeCap,
              color: colors[selectedColor],
            ),
          ],
        ),
      ),
    );
  }
}
