import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/constants/gits_svg.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';
import 'package:gits_flutter_ui_component/pages/foundation/validator/validator_helper.dart';
import 'package:gits_flutter_ui_component/pages/pages/reset_pin/code_snippet.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class ResetPinPage extends StatelessWidget {
  const ResetPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Request Forgot Password page')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetSectionFormResetPinPage,
          child: const ShortDescription(
            title: 'Section Form',
            description: 'Create stateless widget',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleResetPinPage,
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const SingleChildScrollView(child: SectionForm()),
            bottomSheet: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: GitsSizes.s16,
                vertical: GitsSizes.s24,
              ),
              child: GitsButton.elevated(
                key: const ValueKey('btnUbahPin'),
                text: 'Ubah Pin',
                onPressed: () => {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionForm extends StatelessWidget {
  const SectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final pinKey = GlobalKey<GitsTextFieldState>();
    final newKey = GlobalKey<GitsTextFieldState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            GitsSvg.passwordIllustration,
            width: 328,
            height: 184,
          ),
          const GitsSpacing.vertical16(),
          Text(
            'Silakan masukan PIN baru untuk Akun',
            style: context.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'test@example.com',
            style: context.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const GitsSpacing.vertical20(),
          GitsTextField(
            key: pinKey,
            isAutoValidate: true,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            obscureIconKey: const ValueKey('btnShowHide1'),
            textfieldKey: const ValueKey('inputPinBaru'),
            isPassword: true,
            title: 'Pin Baru',
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: "",
              hintText: 'Masukan 6 Digit PIN Anda',
            ),
            validator: ValidatorValueHelper.validatorPIN,
          ),
          const GitsSpacing.vertical20(),
          GitsTextField(
            key: newKey,
            isAutoValidate: true,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            obscureIconKey: const ValueKey('btnShowHide2'),
            textfieldKey: const ValueKey('inputUlangPinBaru'),
            isPassword: true,
            title: 'Ulangi Pin Baru',
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: "",
              hintText: 'Ulangi 6 digit PIN baru',
            ),
            validator: (context, value) =>
                ValidatorValueHelper.validatorConfirmPIN(
              context,
              value,
              pinKey.text,
            ),
          ),
        ],
      ),
    );
  }
}
