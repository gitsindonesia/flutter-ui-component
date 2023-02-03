import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_player/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_player/gits_player.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsPlayerPage extends StatelessWidget {
  const GitsPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Player')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsPlayer,
          child: const ShortDescription(
            title: 'Gits Player',
            description: 'Create component gits player',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsPlayer,
          builder: (context) => const ExampleGitsPlayer(),
        )
      ],
    );
  }
}

class ExampleGitsPlayer extends StatefulWidget {
  const ExampleGitsPlayer({super.key});

  @override
  State<ExampleGitsPlayer> createState() => _ExampleGitsPlayerState();
}

class _ExampleGitsPlayerState extends State<ExampleGitsPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Player')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            GitsPlayer(
              urlVideo:
                  "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            ),
          ],
        ),
      ),
    );
  }
}
