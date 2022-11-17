const codeSnippetGitsTextScaleDown = ''' import 'package:flutter/material.dart';

class GitsTextScaleDown extends StatelessWidget {
  const GitsTextScaleDown(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.style,
    this.fit = FlexFit.loose,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final TextStyle? style;
  final FlexFit fit;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: fit,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
 ''';

const codeSnippetExampleGitsTextScaleDown = ''' Scaffold(
      appBar: AppBar(title: const Text('Example Gits Text Scale Down')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  GitsTextScaleDown(
                    maxLines: 3,
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ''';
