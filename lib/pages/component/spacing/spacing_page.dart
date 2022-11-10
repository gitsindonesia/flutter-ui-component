import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Spacing')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsSizes,
          child: ShortDescription(
            title: 'GitsSizes',
            description: 'Define constants for abstract class GitsSizes',
          ),
        ),
        const CardHighlight(
          codeSnippet: codeSnippetGitsSpacing,
          child: ShortDescription(
            title: 'GitsSpacing',
            description: 'Create component widget GitsSpacing',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetSpacing,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Example Gits Spacing"),
              centerTitle: false,
            ),
            body: Padding(
              padding: const EdgeInsets.all(GitsSizes.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: GitsSizes.s16),
                    child: Text(
                      "Gits Spacing Vertical & Horizontal",
                      style: TextStyle(
                        fontSize: GitsSizes.s20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text("Gits spacing vertical size 16"),
                  const GitsSpacing.vertical16(),
                  const Text("Gits spacing vertical when set manual value 30"),
                  const GitsSpacing.vertical(size: 30),
                  Row(
                    children: const [
                      Text("Gits spacing"),
                      GitsSpacing.horizontal16(),
                      Text("horizontal size 16"),
                    ],
                  ),
                  Row(
                    children: const [
                      Text("Gits spacing horizontal"),
                      GitsSpacing.horizontal(size: 8),
                      Text("when set manual size 8"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
