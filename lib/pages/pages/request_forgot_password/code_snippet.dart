String codeSnippetSectionForm = ''' class SectionForm extends StatelessWidget {
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
}''';

String codeSnippetExampleRequestForgotPasswordPage = ''' Scaffold(
            appBar: AppBar(title: const Text('Request Forgot Password page')),
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
                text: "context.s.send",
                onPressed: () => {},
              ),
            ),
          ), ''';
