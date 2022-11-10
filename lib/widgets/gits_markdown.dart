import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/gits_sizes.dart';
import '../helper/load_asset.dart';

class GitsMarkdown extends StatelessWidget {
  const GitsMarkdown(this.pathAsset, {super.key});

  final String pathAsset;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAsset(pathAsset),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            padding: const EdgeInsets.all(GitsSizes.s16),
            data: snapshot.data ?? '',
            onTapLink: (text, href, title) => launchUrl(Uri.parse(href ?? '')),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
