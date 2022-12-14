String codeSnippetGitsDateTimePicker =
    ''' import 'package:flutter/cupertino.dart';

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
''';

String codeSnippetGitsDateTimePickerExample = ''' 
class ExampleGitsDateTimePicker extends StatefulWidget {
  const ExampleGitsDateTimePicker({super.key});

  @override
  State<ExampleGitsDateTimePicker> createState() =>
      _ExampleGitsDateTimePickerState();
}

class _ExampleGitsDateTimePickerState extends State<ExampleGitsDateTimePicker> {
  String result = "Pilih date terlebih dahulu";
  CupertinoDatePickerMode pickerMode = CupertinoDatePickerMode.date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example Gits Date Time Picker")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(result),
              const GitsSpacing.vertical16(),
              GitsButton.elevated(
                text: "Choose",
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => GitsDateTimePicker(
                            dateTime: DateTime.now(),
                            mode: pickerMode,
                            onDateTimeChanged: (value) {
                              setState(() {
                                result = value.toLocal().toString();
                              });
                            },
                          ));
                },
              ),
              const GitsSpacing.vertical16(),
              CardProperties(
                title: 'Picker Mode',
                selected: pickerMode.name,
                items:
                    CupertinoDatePickerMode.values.map((e) => e.name).toList(),
                onChanged: (value) => setState(() {
                  pickerMode = CupertinoDatePickerMode.values
                      .firstWhere((e) => e.name == value);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}''';
