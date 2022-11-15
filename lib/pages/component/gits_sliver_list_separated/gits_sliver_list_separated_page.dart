import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_sliver_list_separated/code_snippet.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'gits_sliver_list_separated.dart';

class GitsSliverListSeparatedPage extends StatelessWidget {
  const GitsSliverListSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Sliver List Separated')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsSliverListSeparated,
          child: ShortDescription(
            title: 'GitsSliverListSeparated',
            description:
                'A sliver list with separator, similar to ListView.separated but for sliver list instead of list view.',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetGitsSliverListSeparatedExample,
          builder: (context) => Scaffold(
            body: CustomScrollView(
              slivers: [
                const SliverAppBar(title: Text('Example')),
                GitsSliverListSeparated(
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
