import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/foundation/validator/code_snippet.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class ValidatorValuePage extends StatelessWidget {
  const ValidatorValuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Validation')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetValidatorValue,
          child: const ShortDescription(
            title: 'Validator Value',
            description: 'Create file validator value',
          ),
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Handle')),
          ],
          rows: [
            DataRow(
              cells: [
                const DataCell(Text('Validator Email')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('1. Email tidak boleh kosong'),
                    Text('2. Email maksimal 50 karakter '),
                    Text('3. Email tidak sah'),
                  ],
                )),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Validator Pin')),
                DataCell(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('1. Pin harus diisi'),
                      Text('2. Pin dengan format angka'),
                      Text('3. Pin harus 6 digit'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
