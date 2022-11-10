const String codeSnippetSplashPage = '''Scaffold(
  body: Center(
    child: Image.asset(
      Theme.of(context).brightness == Brightness.dark
          ? GitsImages.gitsLight
          : GitsImages.gitsDark,
      width: MediaQuery.of(context).size.width * 0.5,
      fit: BoxFit.contain,
    ),
  ),
)''';
