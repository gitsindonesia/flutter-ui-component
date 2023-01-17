import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_scale_down/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_scale_down/gits_text_scale_down.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Text Scale Down')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GitsTextScaleDown(
                "Lorem Ipsum is simply dummy text",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
