import 'package:flutter/cupertino.dart';

class GitsDateTimePicker extends StatelessWidget {
  const GitsDateTimePicker({
    super.key,
    required this.dateTime,
    required this.onDateTimeChanged,
    required this.mode,
  });

  final DateTime dateTime;
  final ValueChanged<DateTime> onDateTimeChanged;
  final CupertinoDatePickerMode mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
            initialDateTime: dateTime,
            mode: mode,
            use24hFormat: true,
            onDateTimeChanged: onDateTimeChanged),
      ),
    );
  }
}
