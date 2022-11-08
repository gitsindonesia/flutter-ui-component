import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_source_code.dart';
import 'package:gits_flutter_ui_component/pages/component/empty_state/gits_empty_state.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(children: [
      DeviceHighlight(
        codeSnippet: GitsSourceCode.codeSnippetEmptyState,
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Example Gits Empty State"),
            centerTitle: false,
          ),
          body: const GitsEmptyState(text: "Belum ada data yang diinputkan"),
        ),
      )
    ]);
  }
}
