import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_circular_loading/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_circular_loading/gits_circular_loading.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_slider.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsCircularLoadingPage extends StatelessWidget {
  const GitsCircularLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Circular Loading')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsCircularLoading,
          child: ShortDescription(
            title: 'Gits Circular Loading',
            description: 'Create component gits circular loading',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsCircularLoading,
          builder: (context) => const ExampleGitsCircularLoading(),
        )
      ],
    );
  }
}

class ExampleGitsCircularLoading extends StatefulWidget {
  const ExampleGitsCircularLoading({super.key});

  @override
  State<ExampleGitsCircularLoading> createState() =>
      _ExampleGitsCircularLoadingState();
}

class _ExampleGitsCircularLoadingState
    extends State<ExampleGitsCircularLoading> {
  double size = 24;
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
      appBar: AppBar(title: const Text('Example Gits Circular Loading')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GitsCircularLoading(size: size, color: colors[selectedColor]!),
              const GitsSpacing.vertical16(),
              GitsSlider(
                title: 'Circular size',
                value: size,
                max: 50,
                onChanged: (value) => setState(() {
                  size = value;
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
            ],
          ),
        ),
      ),
    );
  }
}
