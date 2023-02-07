import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_dialog/code_snippet.dart';

import '../../../widgets/card_highlight.dart';
import '../../../widgets/device_highlight.dart';
import '../../../widgets/gits_spacing.dart';
import '../../../widgets/scaffold_page.dart';
import '../../../widgets/short_description.dart';
import '../gits_button/gits_button.dart';
import 'gits_dialog.dart';

class GitsDialogPage extends StatelessWidget {
  const GitsDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Image Picker')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsDialog,
          child: ShortDescription(
            title: 'Gits Dialog',
            description: 'Create component Gits Dialog',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsDialog,
          builder: (context) => const ExampleGitsDialogPage(),
        )
      ],
    );
  }
}

class ExampleGitsDialogPage extends StatefulWidget {
  const ExampleGitsDialogPage({super.key});

  @override
  State<ExampleGitsDialogPage> createState() => _ExampleGitsDialogPageState();
}

class _ExampleGitsDialogPageState extends State<ExampleGitsDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Gits Button"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GitsButton.elevated(
                  text: "Default Dialog",
                  onPressed: () async {
                    GitsDialog(
                            context: context,
                            width: 400,
                            title: "Default Dialog",
                            buttonLabel: "Ok",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .show();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.outlined(
                  text: "Dialog Show Error",
                  onPressed: () async {
                    GitsDialog(
                            context: context,
                            width: 500,
                            title: "Dialog Show Error",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showError();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.elevated(
                  text: "Dialog Show Success",
                  onPressed: () async {
                    await GitsDialog(
                            context: context,
                            width: 400,
                            title: "Gits Dialog",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showSuccess();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.outlined(
                  text: "Dialog Show Warning",
                  onPressed: () async {
                    await GitsDialog(
                            context: context,
                            width: 400,
                            title: "Gits Dialog",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showWarning();
                  }),
              const GitsSpacing.vertical16(),
              GitsButton.elevated(
                  text: "Dialog Show Confirm",
                  onPressed: () async {
                    bool isConfirm = await GitsDialog(
                            width: 600,
                            context: context,
                            title: "Gits Dialog",
                            content: "Lorem Ipsum Dolor Sit Amet")
                        .showConfirm();
                    if (isConfirm) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Confirmed')),
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Not Confirm')),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
