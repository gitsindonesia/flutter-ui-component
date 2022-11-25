import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/extension/date_time/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/extension/date_time/date_time_extension.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class DateTimeExtensionPage extends StatelessWidget {
  const DateTimeExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Date Time Extension')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetDateTimeExtension,
          child: const ShortDescription(
            title: 'Date Time Extension',
            description: 'Create file date time extension',
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
                const DataCell(Text('Function toFullDateTime')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DateTime.now().toFullDateTime()'),
                    Text(DateTime.now().toFullDateTime()),
                  ],
                )),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Function toSimpleDateTime')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DateTime.now().toSimpleDateTime()'),
                    Text(DateTime.now().toSimpleDateTime()),
                  ],
                )),
              ],
            ),
            DataRow(
              cells: [
                const DataCell(Text('Function toFormatDate')),
                DataCell(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DateTime.now().toFormatDate()'),
                    Text(DateTime.now().toFormatDate()),
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
