import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_contact/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_contact/gits_contact.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_slider.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsContactPage extends StatelessWidget {
  const GitsContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Contact')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsContact,
          child: const ShortDescription(
            title: 'Gits Contact',
            description: 'Create component gits contact',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsContactPage,
          builder: (context) => const ExampleGitsContactPage(),
        )
      ],
    );
  }
}

class ExampleGitsContactPage extends StatefulWidget {
  const ExampleGitsContactPage({super.key});

  @override
  State<ExampleGitsContactPage> createState() => _ExampleGitsContactPageState();
}

class _ExampleGitsContactPageState extends State<ExampleGitsContactPage> {
  double multiplySize = 2;
  String name = 'Yusup Maulana';
  String selectedIsRemove = 'false';
  Map<String, bool> isRemove = {
    'true': true,
    'false': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsContact(
              name: name,
              isRemove: isRemove[selectedIsRemove]!,
              multiplySize: multiplySize,
            ),
            const GitsSpacing.vertical16(),
            GitsTextField(
              title: 'Name',
              onChanged: (value) => setState(() {
                name = value;
              }),
              decoration: const InputDecoration(
                counterText: "",
                hintText: 'Masukan nama',
              ),
            ),
            const GitsSpacing.vertical16(),
            GitsSlider(
              title: 'multiplySize',
              value: multiplySize,
              max: 3,
              onChanged: (value) => setState(() {
                multiplySize = value;
              }),
            ),
            CardProperties(
              title: 'Bisa hapus?',
              selected: selectedIsRemove,
              items: isRemove.keys.toList(),
              onChanged: (value) => setState(() {
                selectedIsRemove = value;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
