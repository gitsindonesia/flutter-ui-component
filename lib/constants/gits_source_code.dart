abstract class GitsSourceCode {
  static const String codeSnippetEmptyState = '''Scaffold(
          appBar: AppBar(title: const Text("Gits")),
          body: const GitsEmptyState(text: "Belum ada data yang diinputkan"),
        ),''';
  static const String codeSnippetShimmer = '''GitsShimmer(
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
                  );''';
}
