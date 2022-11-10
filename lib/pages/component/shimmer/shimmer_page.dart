import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/shimmer/gits_shimmer.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';

class ShimmerPage extends StatelessWidget {
  const ShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Shimmer')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsShimmer,
          child: ShortDescription(
            title: 'Gits Shimmer',
            description: 'Create component shimmer widget',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetShimmer,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Example Gits Shimmer"),
              centerTitle: false,
            ),
            body: GitsShimmer(
              child: ListView.separated(
                padding: const EdgeInsets.all(GitsSizes.s16),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const GitsItemShimmer(
                        width: GitsSizes.s48,
                        height: GitsSizes.s48,
                        boxShape: BoxShape.circle,
                      ),
                      const GitsSpacing.horizontal16(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const GitsItemShimmer(
                              width: double.infinity,
                              height: GitsSizes.s16,
                            ),
                            const GitsSpacing.vertical8(),
                            Row(
                              children: const [
                                GitsItemShimmer(
                                  width: GitsSizes.s44,
                                  height: GitsSizes.s16,
                                ),
                                GitsSpacing.horizontal8(),
                                GitsItemShimmer(
                                  height: GitsSizes.s16,
                                  width: 80,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const GitsSpacing.vertical16(),
                itemCount: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
