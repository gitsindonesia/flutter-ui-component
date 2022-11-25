import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_search/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_search/gits_search.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsSearchPage extends StatelessWidget {
  const GitsSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Search')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsSearch,
          child: const ShortDescription(
            title: 'Gits Search',
            description: 'Create component gits search',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsSearch,
          builder: (context) => const ExampleGitsSearchPage(),
        )
      ],
    );
  }
}

class ExampleGitsSearchPage extends StatefulWidget {
  const ExampleGitsSearchPage({super.key});

  @override
  State<ExampleGitsSearchPage> createState() => _ExampleGitsSearchPageState();
}

class _ExampleGitsSearchPageState extends State<ExampleGitsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsSearch(
              hintText: 'Cari penjualan',
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
