import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/empty_state/gits_empty_state.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';

class EmptyStatePage extends StatelessWidget {
  const EmptyStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Empty State')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsEmptyState,
          child: ShortDescription(
            title: 'Gits Empty State',
            description: 'Create component empty state widget',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetEmptyState,
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text("Example Gits Empty State")),
            body: const GitsEmptyState(text: "Belum ada data yang diinputkan"),
          ),
        )
      ],
    );
  }
}
