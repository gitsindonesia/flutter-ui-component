import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';
import 'gits_row_separated.dart';

class GitsRowSeparatedPage extends StatelessWidget {
  const GitsRowSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Row Separated')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsRowSeparated,
          child: Row(
            children: const [
              ShortDescription(
                title: 'GitsRowSeparated',
                description:
                    'Gits row separated is used to create a row with the addition of a separator builder, its use is the same as we created a ListView.separated with scroll direction Axis.horizontal',
              ),
            ],
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsRowSeparated,
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Example')),
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16),
              child: GitsRowSeparated(
                itemBuilder: (context, index) => Text('Item $index'),
                separatorBuilder: (context, index) =>
                    const GitsSpacing.horizontal16(),
                itemCount: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
