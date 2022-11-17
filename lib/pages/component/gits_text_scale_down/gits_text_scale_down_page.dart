import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_scale_down/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_scale_down/gits_text_scale_down.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_slider.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsTextScaleDownPage extends StatelessWidget {
  const GitsTextScaleDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Circular Loading')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsTextScaleDown,
          child: ShortDescription(
            title: 'Gits Text Scale Down',
            description: 'Create component gits circular loading',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsTextScaleDown,
          builder: (context) => const ExampleGitsTextScaleDown(),
        )
      ],
    );
  }
}

class ExampleGitsTextScaleDown extends StatefulWidget {
  const ExampleGitsTextScaleDown({super.key});

  @override
  State<ExampleGitsTextScaleDown> createState() =>
      _ExampleGitsTextScaleDownState();
}

class _ExampleGitsTextScaleDownState extends State<ExampleGitsTextScaleDown> {
  String selectedFit = 'loose';
  double maxLines = 1;

  Map<String, FlexFit> fit = {
    'tight': FlexFit.tight,
    'loose': FlexFit.loose,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Text Scale Down')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  GitsTextScaleDown(
                    "First Name",
                    fit: fit[selectedFit]!,
                  ),
                  GitsTextScaleDown(
                    "Last Name",
                    fit: fit[selectedFit]!,
                  ),
                ],
              ),
              const GitsSpacing.vertical16(),
              CardProperties(
                title: 'Fit',
                selected: selectedFit,
                items: fit.keys.toList(),
                onChanged: (value) => setState(() {
                  selectedFit = value;
                }),
              ),
              const GitsSpacing.vertical16(),
              Row(
                children: [
                  GitsTextScaleDown(
                    maxLines: maxLines.toInt(),
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                ],
              ),
              const GitsSpacing.vertical16(),
              GitsSlider(
                title: 'Circular size',
                value: maxLines,
                max: 5,
                onChanged: (value) => setState(() {
                  maxLines = value.toInt() == 0 ? 1 : value;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
