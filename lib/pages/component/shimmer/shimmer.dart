import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/constants/gits_source_code.dart';
import 'package:gits_flutter_ui_component/pages/component/shimmer/gits_shimmer.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      children: [
        DeviceHighlight(
          codeSnippet: GitsSourceCode.codeSnippetShimmer,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Example Gits Shimmer"),
              centerTitle: false,
            ),
            body: Column(
              children: [
                Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(
                    horizontal: GitsSizes.s16,
                    vertical: GitsSizes.s8,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: GitsSizes.s14,
                    vertical: GitsSizes.s2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(GitsSizes.s8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(26),
                        blurRadius: 40,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: GitsShimmer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const GitsItemShimmer(
                              width: GitsSizes.s48,
                              height: GitsSizes.s48,
                              radius: GitsSizes.s80,
                            ),
                            const GitsSpacing.horizontal16(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GitsItemShimmer(
                                  width: 200,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
