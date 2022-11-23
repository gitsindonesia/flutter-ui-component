import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsButtonPage extends StatelessWidget {
  const GitsButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Button')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsButton,
          child: const ShortDescription(
            title: 'Gits Button',
            description: 'Create component gits button',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsButton,
          builder: (context) => const ExampleGitsButtonPage(),
        )
      ],
    );
  }
}

class ExampleGitsButtonPage extends StatefulWidget {
  const ExampleGitsButtonPage({super.key});

  @override
  State<ExampleGitsButtonPage> createState() => _ExampleGitsButtonPageState();
}

class _ExampleGitsButtonPageState extends State<ExampleGitsButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Gits Button"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GitsButton.text(
              text: "Text",
              onPressed: () => {},
            ),
            const GitsSpacing.vertical16(),
            GitsButton.outlined(
              text: "Outline",
              onPressed: () => {},
            ),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Elevated",
              onPressed: () => {},
            ),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              isLoading: true,
              text: "Loading",
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
