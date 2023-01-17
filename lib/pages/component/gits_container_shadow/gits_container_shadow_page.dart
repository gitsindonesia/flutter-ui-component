import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_container_shadow/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_container_shadow/gits_container_shadow.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsContainerShadowPage extends StatelessWidget {
  const GitsContainerShadowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Contact')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsContainerShadow,
          child: const ShortDescription(
            title: 'Gits Container Shadow',
            description: 'Create component gits contact',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsContainerShadowPage,
          builder: (context) => const ExampleGitsContainerShadowPage(),
        )
      ],
    );
  }
}

class ExampleGitsContainerShadowPage extends StatefulWidget {
  const ExampleGitsContainerShadowPage({super.key});

  @override
  State<ExampleGitsContainerShadowPage> createState() =>
      _ExampleGitsContainerShadowPageState();
}

class _ExampleGitsContainerShadowPageState
    extends State<ExampleGitsContainerShadowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Container Shadow')),
      body: Column(
        children: [
          GitsContainerShadow(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Headline'),
                const GitsSpacing.horizontal16(),
                const Expanded(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const GitsSpacing.horizontal16(),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
