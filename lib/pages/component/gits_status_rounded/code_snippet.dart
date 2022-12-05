String codeSnippetGitsStatusRounded =
    ''' import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';

class GitsStatusRounded extends StatelessWidget {
  const GitsStatusRounded({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
  });

  final String text;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: GitsSizes.s4,
        horizontal: GitsSizes.s8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GitsSizes.s80),
        color: backgroundColor ?? Colors.blue.shade600,
      ),
      child: Text(
        text,
        style: context.bodySmall?.copyWith(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
''';

String codeSnippetExampleGitsStatusRounded = '''Scaffold(
      appBar: AppBar(title: const Text('Example Gits Status Rounded')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            GitsStatusRounded(text: "Selesai"),
            GitsSpacing.vertical16(),
            GitsStatusRounded(
              text: "Proses",
              backgroundColor: Colors.orangeAccent,
            ),
            GitsSpacing.vertical16(),
            GitsStatusRounded(
                text: "Error",
                backgroundColor: Colors.redAccent,
                textColor: Colors.white),
          ],
        ),
      ),
    );''';
