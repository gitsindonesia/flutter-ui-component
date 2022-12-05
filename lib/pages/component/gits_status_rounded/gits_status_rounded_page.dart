import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_rounded/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_rounded/gits_status_rounded.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsStatusRoundedPage extends StatelessWidget {
  const GitsStatusRoundedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Status Rounded')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsStatusRounded,
          child: const ShortDescription(
            title: 'Gits Status Rounded',
            description: 'Create component',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsStatusRounded,
          builder: (context) => const ExampleGitsStatusRoundedPage(),
        )
      ],
    );
  }
}

class ExampleGitsStatusRoundedPage extends StatefulWidget {
  const ExampleGitsStatusRoundedPage({super.key});

  @override
  State<ExampleGitsStatusRoundedPage> createState() =>
      _ExampleGitsStatusRoundedPageState();
}

class _ExampleGitsStatusRoundedPageState
    extends State<ExampleGitsStatusRoundedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Status Rounded')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            GitsStatusRounded(text: "Selesai"),
            GitsSpacing.vertical16(),
            GitsStatusRounded(
              text: "Proses",
              backgroundColor: Colors.orangeAccent,
            ),
            GitsSpacing.vertical16(),
            GitsStatusRounded(
                text: "Error",
                backgroundColor: Colors.redAccent,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
