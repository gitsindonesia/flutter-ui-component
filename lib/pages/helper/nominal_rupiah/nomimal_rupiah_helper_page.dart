import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/helper/nominal_rupiah/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/helper/nominal_rupiah/nomimal_rupiah_helper.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class NominalRupiahHelperPage extends StatelessWidget {
  const NominalRupiahHelperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Helper Get Nominal Rupiah')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetNominalRupiah,
          child: const ShortDescription(
            title: 'Nominal Rupiah',
            description: 'Convert int to nominal Rupiah',
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
                const DataCell(Text('Function getNominalRupiah')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('getNominalRupiah(19500200)'),
                    Text(getNominalRupiah(19500200)),
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
