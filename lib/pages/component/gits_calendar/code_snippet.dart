String codeSnippetGitsCalendar = ''' import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';

class GitsCalendar extends StatefulWidget {
  const GitsCalendar({
    Key? key,
    this.initialDate,
    required this.firstDay,
    required this.lastDay,
    required this.onDateChanged,
  }) : super(key: key);

  final DateTime? initialDate;
  final DateTime firstDay;
  final DateTime lastDay;
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<GitsCalendar> createState() => _GitsCalendarState();
}

class _GitsCalendarState extends State<GitsCalendar> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  DateTime? _lastDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialDate ?? DateTime.now();
    _selectedDay = widget.initialDate;
    _lastDay = widget.initialDate?.isBefore(widget.lastDay) ?? true
        ? widget.lastDay
        : widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TableCalendar(
          locale: 'id',
          availableGestures: AvailableGestures.horizontalSwipe,
          firstDay: widget.firstDay,
          lastDay: _lastDay ?? widget.lastDay,
          focusedDay: _focusedDay,
          currentDay: _selectedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            leftChevronVisible: true,
            leftChevronIcon: const Icon(
              Icons.chevron_left,
              color: Colors.grey,
            ),
            rightChevronVisible: true,
            rightChevronIcon: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
            titleCentered: true,
            headerPadding: EdgeInsets.zero,
            titleTextStyle: context.titleMedium!.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
            ),
            formatButtonVisible: false,
          ),
          rowHeight: 40,
          daysOfWeekHeight: 40,
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              final text = DateFormat.E('id').format(day);
              return Center(
                child: Text(
                  text[0],
                  style: context.bodyMedium?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
            disabledBuilder: (context, day, focusedDay) => Center(
              child: Text(
                day.day.toString(),
                style: context.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            todayBuilder: (context, day, focusedDay) => Container(
              margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: context.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            selectedBuilder: (context, day, focusedDay) => Container(
              margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: context.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDateChanged(selectedDay);
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ],
    );
  }
}
''';

String codeSnippetExampleGitsCalendar = ''' 
 Scaffold(
      appBar: AppBar(title: const Text('Example Gits Calendar')),
      body: Column(
        children: [
          GitsCalendar(
            firstDay: DateTime(now.year - 5, now.month, now.day),
            lastDay: now,
            initialDate: now,
            onDateChanged: (time) => setState(() => selectedDay = time),
          ),
        ],
      ),
    );
''';
