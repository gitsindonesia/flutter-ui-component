import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/constants/gits_source_code.dart';
import 'package:gits_flutter_ui_component/pages/component/spacing/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class Spacing extends StatelessWidget {
  const Spacing({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(children: [
      DeviceHighlight(
        codeSnippet: GitsSourceCode.codeSnippetSpacing,
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
    ]);
  }
}
