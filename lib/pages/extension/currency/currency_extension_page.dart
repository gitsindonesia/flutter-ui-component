import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/extension/currency/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/extension/currency/currency_extension.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class CurrencyExtensionPage extends StatefulWidget {
  const CurrencyExtensionPage({super.key});

  @override
  State<CurrencyExtensionPage> createState() => _CurrencyExtensionPageState();
}

class _CurrencyExtensionPageState extends State<CurrencyExtensionPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Currency Extension')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetExampleCurrencyExtensionPage,
          child: const ShortDescription(
            title: 'Currency Extension',
            description: 'Create file currency extension',
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
                const DataCell(Text('Function toCurrency')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('10000.toCurrency()'),
                    Text(10000.toCurrency()),
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
