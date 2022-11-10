import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class TyphographyPage extends StatelessWidget {
  const TyphographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Typography')),
      children: [
        Text(
          'Display Large',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'Display Medium',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          'Display Small',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          'Headline Large',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Headline Medium',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'Headline Small',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'Title Large',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Title Medium',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Title Small',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          'Label Large',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          'Label Medium',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          'Label Small',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          'Body Large',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Body Medium',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'Body Small',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const GitsSpacing.vertical16(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Line Height')),
              DataColumn(label: Text('Font Size')),
              DataColumn(label: Text('Font Weight')),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text('Display Large')),
                  DataCell(Text('64')),
                  DataCell(Text('57')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Display Medium')),
                  DataCell(Text('52')),
                  DataCell(Text('45')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Display Medium')),
                  DataCell(Text('44')),
                  DataCell(Text('36')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Headline Large')),
                  DataCell(Text('40')),
                  DataCell(Text('32')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Headline Medium')),
                  DataCell(Text('36')),
                  DataCell(Text('28')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Headline Medium')),
                  DataCell(Text('32')),
                  DataCell(Text('24')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Title Large')),
                  DataCell(Text('28')),
                  DataCell(Text('22')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Title Medium')),
                  DataCell(Text('24')),
                  DataCell(Text('16')),
                  DataCell(Text('500')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Title Medium')),
                  DataCell(Text('20')),
                  DataCell(Text('14')),
                  DataCell(Text('500')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Label Large')),
                  DataCell(Text('20')),
                  DataCell(Text('14')),
                  DataCell(Text('500')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Label Medium')),
                  DataCell(Text('16')),
                  DataCell(Text('12')),
                  DataCell(Text('500')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Label Medium')),
                  DataCell(Text('16')),
                  DataCell(Text('11')),
                  DataCell(Text('500')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Body Large')),
                  DataCell(Text('24')),
                  DataCell(Text('16')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Body Medium')),
                  DataCell(Text('20')),
                  DataCell(Text('14')),
                  DataCell(Text('400')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Body Medium')),
                  DataCell(Text('16')),
                  DataCell(Text('12')),
                  DataCell(Text('400')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
