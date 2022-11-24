import 'package:flutter/material.dart';
import 'package:gits_extension/gits_extension.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_calendar/gits_calendar.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsBottomSheetCalendar extends StatefulWidget {
  const GitsBottomSheetCalendar({
    Key? key,
    this.initialDate,
    required this.firstDay,
    required this.lastDay,
    required this.onCancel,
    required this.onSelect,
  }) : super(key: key);

  final DateTime? initialDate;
  final DateTime firstDay;
  final DateTime lastDay;
  final GestureTapCallback onCancel;
  final ValueChanged<DateTime> onSelect;

  @override
  State<GitsBottomSheetCalendar> createState() =>
      _GitsBottomSheetCalendarState();
}

class _GitsBottomSheetCalendarState extends State<GitsBottomSheetCalendar> {
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GitsCalendar(
          initialDate: widget.initialDate,
          firstDay: widget.firstDay,
          lastDay: widget.lastDay,
          onDateChanged: (time) => setState(() => _selectedDay = time),
        ),
        const GitsSpacing.vertical24(),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(GitsSizes.s16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GitsButton.outlined(
                  text: 'Batal',
                  onPressed: widget.onCancel,
                ),
              ),
              const GitsSpacing.horizontal16(),
              Expanded(
                child: GitsButton.elevated(
                  text: 'Simpan',
                  onPressed: () {
                    _selectedDay?.run((it) {
                      widget.onSelect(it);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
