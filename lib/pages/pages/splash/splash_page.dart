import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_images.dart';
import 'package:gits_flutter_ui_component/pages/pages/splash/code_snippet.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Splash Screen')),
      children: [
        DeviceHighlight(
          codeSnippet: codeSnippetSplashPage,
          builder: (context) => Scaffold(
            body: Center(
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? GitsImages.gitsLight
                    : GitsImages.gitsDark,
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
