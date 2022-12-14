import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_rounded/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_rounded/gits_status_rounded.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
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
  String selectedTextColor = 'grey';
  Map<String, Color> textColors = {
    'grey': Colors.grey,
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'black': Colors.black,
  };

  String selectedBackgroundColor = 'grey';
  Map<String, Color> bgColors = {
    'grey': Colors.grey.shade300,
    'red': Colors.red.shade300,
    'green': Colors.green.shade300,
    'blue': Colors.blue.shade300,
    'black': Colors.black38,
  };
  String text = "status";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Status Rounded')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsStatusRounded(
                text: text,
                backgroundColor: bgColors[selectedBackgroundColor],
                textColor: textColors[selectedTextColor]),
            const GitsSpacing.vertical16(),
            GitsTextField(
              title: 'Status Text',
              onChanged: (value) => setState(() {
                text = value;
              }),
              decoration: const InputDecoration(
                counterText: "",
                hintText: 'Masukan text yang diinginkan',
              ),
            ),
            const GitsSpacing.vertical16(),
            CardProperties(
              title: 'Background Color',
              selected: selectedBackgroundColor,
              items: bgColors.keys.toList(),
              onChanged: (value) => setState(() {
                selectedBackgroundColor = value;
              }),
            ),
            const GitsSpacing.vertical16(),
            CardProperties(
              title: 'Text Color',
              selected: selectedTextColor,
              items: textColors.keys.toList(),
              onChanged: (value) => setState(() {
                selectedTextColor = value;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
