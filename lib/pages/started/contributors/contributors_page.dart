import 'package:flutter/material.dart';

import '../../../widgets/gits_markdown.dart';

class ContributorsPage extends StatelessWidget {
  const ContributorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contributors')),
      body: const GitsMarkdown('Contributors.md'),
    );
  }
}
