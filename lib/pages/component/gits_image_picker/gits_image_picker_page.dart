import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_image_picker/gits_image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/card_highlight.dart';
import '../../../widgets/device_highlight.dart';
import '../../../widgets/gits_spacing.dart';
import '../../../widgets/scaffold_page.dart';
import '../gits_button/gits_button.dart';
import 'code_snippet.dart';

class GitsImagePickerPage extends StatelessWidget {
  const GitsImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Image Picker')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsImagePicker,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gits Image Picker",
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const GitsSpacing.vertical8(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Create component gits image picker, for reference installation click ",
                      style: context.bodyMedium,
                    ),
                    TextSpan(
                      text: 'here',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(
                              Uri.parse("https://pub.dev/packages/image_picker"));
                        },
                    ),
                  ],
                ),
              ),
              const Text(""),
            ],
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsImagePicker,
          builder: (context) => const ExampleGitsImagePicker(),
        )
      ],
    );
  }
}

class ExampleGitsImagePicker extends StatefulWidget {
  const ExampleGitsImagePicker({super.key});

  @override
  State<ExampleGitsImagePicker> createState() => _ExampleGitsImagePickerState();
}

class _ExampleGitsImagePickerState extends State<ExampleGitsImagePicker> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Gits Button"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GitsButton.elevated(
              text: "Image Picker",
              onPressed: () async {
                File? result =
                    await ImagePickerService().dialogImageEditProfil(context);
                setState(() {
                  file = result;
                });
              },
            ),
            const GitsSpacing.vertical16(),
            Text("Result", style: context.titleLarge),
            const GitsSpacing.vertical12(),
            (file != null) ? Image.network(file!.path) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
