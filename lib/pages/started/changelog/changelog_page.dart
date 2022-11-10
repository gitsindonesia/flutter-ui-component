import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/helper/load_asset.dart';

class ChangelogPage extends StatelessWidget {
  const ChangelogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Changelog')),
      body: FutureBuilder(
        future: loadAsset('CHANGELOG.md'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              padding: const EdgeInsets.all(GitsSizes.s16),
              data: snapshot.data ?? '',
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
