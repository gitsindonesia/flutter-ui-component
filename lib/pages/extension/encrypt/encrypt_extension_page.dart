import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/extension/encrypt/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/extension/encrypt/encrypt_extension.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class EncryptExtensionPage extends StatelessWidget {
  const EncryptExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Encrypt Extension')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetEncryptExtension,
          child: const ShortDescription(
            title: 'Encrypt Extension',
            description: 'Create file encrypt extension',
          ),
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Example')),
          ],
          rows: [
            DataRow(
              cells: [
                const DataCell(Text('Function encrypt')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("'1234567890'.encrypt('p2s5v8y/B?E(H+Mb')"),
                    Row(
                      children: [
                        const Text('result : '),
                        Text('1234567890'.encrypt('p2s5v8y/B?E(H+Mb')),
                      ],
                    ),
                  ],
                )),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Function decrypt')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "'rCpkWBuv37Czsw=='.decrypt('p2s5v8y/B?E(H+Mb')"),
                    Row(
                      children: [
                        const Text('result : '),
                        Text("rCpkWBuv37Czsw==".decrypt('p2s5v8y/B?E(H+Mb')),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
