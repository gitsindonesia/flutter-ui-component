import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_message/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_message/gits_status_message.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsStatusMessagePage extends StatelessWidget {
  const GitsStatusMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Status Message')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsStatusMessage,
          child: const ShortDescription(
            title: 'Gits Status Message',
            description: 'Create component',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsStatusMessage,
          builder: (context) => const ExampleGitsStatusMessagePage(),
        )
      ],
    );
  }
}

class ExampleGitsStatusMessagePage extends StatefulWidget {
  const ExampleGitsStatusMessagePage({super.key});

  @override
  State<ExampleGitsStatusMessagePage> createState() =>
      _ExampleGitsStatusMessagePageState();
}

class _ExampleGitsStatusMessagePageState
    extends State<ExampleGitsStatusMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Status Message')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const GitsStatusMessage(
                backgroundColor: Colors.black,
                iconColor: Colors.white,
                iconData: Icons.info,
                textColor: Colors.white,
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            const GitsSpacing.vertical16(),
            GitsStatusMessage.info(
                context: context,
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            const GitsSpacing.vertical16(),
            GitsStatusMessage.infoBlue(
              context: context,
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            const GitsSpacing.vertical16(),
            GitsStatusMessage.infoBlue(
              context: context,
              child: Column(
                children: const [
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                  GitsSpacing.vertical4(),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
