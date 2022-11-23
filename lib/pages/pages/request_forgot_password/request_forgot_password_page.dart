import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/constants/gits_svg.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';
import 'package:gits_flutter_ui_component/pages/foundation/validator/validator_helper.dart';
import 'package:gits_flutter_ui_component/pages/pages/request_forgot_password/code_snippet.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class RequestForgotPasswordPage extends StatelessWidget {
  const RequestForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Request Forgot Password page')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetSectionForm,
          child: const ShortDescription(
            title: 'Section Form',
            description: 'Create stateless widget',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleRequestForgotPasswordPage,
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Forgot Password')),
            body: const SingleChildScrollView(child: SectionForm()),
            bottomSheet: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: GitsSizes.s16,
                vertical: GitsSizes.s24,
              ),
              child: GitsButton.elevated(
                key: const ValueKey('btnKirim'),
                isLoading: false,
                text: "Kirim",
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SvgPicture.asset(
            GitsSvg.passwordIllustration,
            width: 328,
            height: 184,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: GitsSizes.s16),
            child: Text(
              'Kami akan mengirimkan kode verifikasi ke email anda untuk reset password',
              style: context.bodySmall,
            ),
          ),
          const GitsTextField(
            key: ValueKey('emailKey'),
            title: 'Email',
            maxLength: 50,
            isAutoValidate: true,
            textfieldKey: ValueKey("inputEmail"),
            keyboardType: TextInputType.emailAddress,
            validator: ValidatorValueHelper.validatorEmail,
            decoration: InputDecoration(
              counterText: "",
              hintText: 'Masukan Email',
            ),
          ),
        ],
      ),
    );
  }
}
