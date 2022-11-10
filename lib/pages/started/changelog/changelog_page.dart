import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/widgets/gits_markdown.dart';

class ChangelogPage extends StatelessWidget {
  const ChangelogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Changelog')),
      body: const GitsMarkdown('CHANGELOG.md'),
    );
  }
}
