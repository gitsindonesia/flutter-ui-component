import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_images.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/gits_markdown.dart';

class HowToContributePage extends StatelessWidget {
  const HowToContributePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How To Contribute'),
        actions: [
          GestureDetector(
            onTap: () => launchUrl(
              Uri.parse(
                'https://github.com/gitsindonesia/flutter-ui-component',
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(GitsImages.githubMark),
                  const GitsSpacing.horizontal8(),
                  Image.asset(GitsImages.github),
                ],
              ),
            ),
          ),
        ],
      ),
      body: const GitsMarkdown('assets/markdown/how_to_contribute.md'),
    );
  }
}
