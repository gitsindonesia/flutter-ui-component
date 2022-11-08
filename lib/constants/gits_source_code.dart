abstract class GitsSourceCode {
  static const String codeSnippetEmptyState = '''Scaffold(
          appBar: AppBar(title: const Text("Gits")),
          body: const GitsEmptyState(text: "Belum ada data yang diinputkan"),
        ),''';
  static const String codeSnippetSpacing = '''Scaffold(
          appBar: AppBar(),
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
