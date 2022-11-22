String codeSnippetExampleResetPinPage = ''' Scaffold(
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
          )''';

String codeSnippetSectionFormResetPinPage =
    ''' class SectionForm extends StatelessWidget {
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
} ''';
