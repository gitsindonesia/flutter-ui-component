import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_column_separated/gits_column_separated.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';

class GitsColumnSeparatedPage extends StatelessWidget {
  const GitsColumnSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Column Separated')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsColumnSeparated,
          child: Column(
            children: const [
              ShortDescription(
                title: 'GitsColumnSeparated',
                description:
                    'Gits column separated is used to create a column with the addition of a separator builder, its use is the same as we created a ListView.separated',
              ),
            ],
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsColumnSeparated,
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Example')),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: GitsColumnSeparated(
                itemBuilder: (context, index) => Text('Item $index'),
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
