import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_images.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      children: [
        DeviceHighlight(
          codeSnippet: '''Scaffold(
  body: Center(
    child: Image.asset(
      GitsImages.gitsDark,
      width: MediaQuery.of(context).size.width * 0.5,
    ),
  ),
)''',
          builder: (context) => Scaffold(
            body: Center(
              child: Image.asset(
                GitsImages.gitsDark,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
