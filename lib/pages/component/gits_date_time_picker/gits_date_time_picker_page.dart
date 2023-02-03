import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_date_time_picker/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_date_time_picker/gits_date_time_picker.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsDateTimePickerPage extends StatelessWidget {
  const GitsDateTimePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Date Time Picker')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsDateTimePicker,
          child: const ShortDescription(
            title: 'Gits Date Time Picker',
            description: 'Create component Gits Date Time Picker',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetGitsDateTimePickerExample,
          builder: (context) => const ExampleGitsDateTimePicker(),
        ),
      ],
    );
  }
}

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
}
