import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_calendar/code_snippet.dart';

import 'package:gits_flutter_ui_component/pages/component/gits_calendar/gits_calendar.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsCalendarPage extends StatelessWidget {
  const GitsCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Contact')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsCalendar,
          child: const ShortDescription(
            title: 'Gits Calendar',
            description: 'Create component gits calendar',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsCalendar,
          builder: (context) => const ExampleGitsCalendarPage(),
        )
      ],
    );
  }
}

class ExampleGitsCalendarPage extends StatefulWidget {
  const ExampleGitsCalendarPage({super.key});

  @override
  State<ExampleGitsCalendarPage> createState() =>
      _ExampleGitsCalendarPageState();
}

class _ExampleGitsCalendarPageState extends State<ExampleGitsCalendarPage> {
  final DateTime now = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Calendar')),
      body: Column(
        children: [
          GitsCalendar(
            firstDay: DateTime(now.year - 5, now.month, now.day),
            lastDay: now,
            initialDate: now,
            onDateChanged: (time) => setState(() => selectedDay = time),
          ),
          const GitsSpacing.vertical16(),
          Text('Hari terpilih : $selectedDay'),
        ],
      ),
    );
  }
}
