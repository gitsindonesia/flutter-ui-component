import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/src/gits_text_field.dart';
import 'package:gits_flutter_ui_component/pages/foundation/validator/validator_helper.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsTextFieldPage extends StatelessWidget {
  const GitsTextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Button')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetShowStatusMessageTextField,
          child: const ShortDescription(
            title: 'Show Status Message',
            description: 'Create file show status message',
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextFieldMessageTextField,
          child: const ShortDescription(
            title: 'Text Field Message',
            description: 'Create file text field message',
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetValidatorValueTextField,
          child: const ShortDescription(
            title: 'Validator Value',
            description: 'Create file validator value',
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetGitsTextField,
          child: const ShortDescription(
            title: 'Gits Text Field',
            description: 'Create component gits text field',
          ),
        ),
        DeviceHighlight(
          codeSnippet: "codeSnippetExampleGitsButton",
          builder: (context) => const ExampleGitsTextField(),
        )
      ],
    );
  }
}

class ExampleGitsTextField extends StatefulWidget {
  const ExampleGitsTextField({super.key});

  @override
  State<ExampleGitsTextField> createState() => _ExampleGitsTextFieldState();
}

class _ExampleGitsTextFieldState extends State<ExampleGitsTextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example Gits Text Field")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const GitsTextField(
                title: 'Email',
                isAutoValidate: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Masukan Email'),
                validator: ValidatorValueHelper.validatorEmail,
                textInputAction: TextInputAction.next,
              ),
              const GitsSpacing.vertical16(),
              GitsTextField(
                isPassword: true,
                isAutoValidate: true,
                title: 'Pin',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration:
                    const InputDecoration(hintText: 'Masukan 6 Digit Pin Anda'),
                validator: ValidatorValueHelper.validatorPIN,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
