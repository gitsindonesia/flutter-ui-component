import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_form_calendar.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitBottomSheetPage extends StatelessWidget {
  const GitBottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Contact')),
      children: [
        CardHighlight(
          codeSnippet: "codeSnippetGitsContact",
          child: const ShortDescription(
            title: 'Gits Contact',
            description: 'Create component gits contact',
          ),
        ),
        DeviceHighlight(
          codeSnippet: "codeSnippetExampleGitsContactPage",
          builder: (context) => const ExampleGitBottomSheetPage(),
        )
      ],
    );
  }
}

class ExampleGitBottomSheetPage extends StatefulWidget {
  const ExampleGitBottomSheetPage({super.key});

  @override
  State<ExampleGitBottomSheetPage> createState() =>
      _ExampleGitBottomSheetPageState();
}

class _ExampleGitBottomSheetPageState extends State<ExampleGitBottomSheetPage> {
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsButton.elevated(
                onPressed: () => context.showBottomSheet(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Widget Bebas"),
                        Text("Widget Bebas"),
                        Text("Widget Bebas"),
                      ],
                    ),
                    title: "Custom Bottom Sheet"),
                text: "Custom Bottom Sheet"),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Range Calendar Bottom Sheet",
              onPressed: () => context.showButtonSheetFormCalendar(
                firstDay: DateTime(now.year - 5, now.month, now.day),
                lastDay: now,
                onCanceled: () => Navigator.pop(context),
                onSaved: (startDate, endDate) => Navigator.pop(context),
              ),
            ),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Calendar Bottom Sheet",
              onPressed: () => context.showButtonSheetCalendar(
                  firstDay: DateTime(now.year - 5, now.month, now.day),
                  lastDay: now,
                  onCancel: () => Navigator.pop(context),
                  onSelect: (value) => Navigator.pop(context)),
            ),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Success Buttom Sheet",
              onPressed: () => context.showButtonSheetSuccess(
                  title: "Registrasi Berhasil",
                  successButtonText: "Oke",
                  successMessage:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
            )
          ],
        ),
      ),
    );
  }
}
