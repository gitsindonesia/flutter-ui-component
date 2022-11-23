String codeSnippetTextFieldMessageTextField =
    ''' import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';

class TextFieldMessage extends StatelessWidget {
  const TextFieldMessage.info({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.orange,
        super(key: key);

  const TextFieldMessage.success({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.green,
        super(key: key);

  const TextFieldMessage.error({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.red,
        super(key: key);

  const TextFieldMessage.warning({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.yellow,
        super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GitsSizes.s4),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
''';

String codeSnippetValidatorValueTextField =
    ''' import 'package:equatable/equatable.dart';
import 'show_status_message.dart';

class ValidatorValue extends Equatable {
  const ValidatorValue({
    required this.message,
    required this.showStatusMessage,
  });
  final String message;
  final ShowStatusMessage showStatusMessage;

  static ValidatorValue get none {
    return const ValidatorValue(
      message: '',
      showStatusMessage: ShowStatusMessage.none,
    );
  }

  @override
  List<Object?> get props => [message, showStatusMessage];
}
''';
String codeSnippetGitsTextField = ''' import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';

import 'show_status_message.dart';
import 'text_field_message.dart';
import 'validator_value.dart';

extension GlobalKeyGitsTextFieldStateExtension
    on GlobalKey<GitsTextFieldState> {
  String get text => currentState?.controller.text ?? '';
  set text(String value) => currentState?.setText(value);
  bool get isValid => currentState?.isValid ?? false;
  void validate() => currentState?.validate();
  void requestFocus() => currentState?.requestFocus();
  void clear() => currentState?.setText('');
}

extension ValidatorExtension on ValidatorValue? {
  bool isValid() =>
      this == null ||
      this?.showStatusMessage == ShowStatusMessage.none ||
      this?.showStatusMessage == ShowStatusMessage.success;
}

enum ShowStatusMessage { none, error, info, success, warning }

class GitsTextField extends StatefulWidget {
  const GitsTextField({
    Key? key,
    this.title,
    this.decoration = const InputDecoration(),
    this.inputFormatters,
    this.keyboardType,
    this.autofocus = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.readOnly = false,
    this.style,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.isPassword = false,
    this.textInputAction = TextInputAction.done,
    this.isAutoValidate = false,
    this.textfieldKey,
    this.obscureIconKey,
    this.enabled,
  }) : super(key: key);

  final String? title;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool autofocus;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final ValidatorValue? Function(BuildContext context, String value)? validator;
  final bool isPassword;
  final TextInputAction textInputAction;
  final bool isAutoValidate;
  final Key? textfieldKey;
  final Key? obscureIconKey;
  final bool? enabled;

  @override
  State<GitsTextField> createState() => GitsTextFieldState();
}

class GitsTextFieldState extends State<GitsTextField> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  bool obscureText = false;
  bool isFocus = false;
  bool isAutoValidate = false;
  bool isReadOnly = false;

  ValidatorValue validatorValue = ValidatorValue.none;

  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      obscureText = true;
    }
    focusNode.addListener(() {
      setState(() {
        isFocus = focusNode.hasFocus;
      });
    });
    isAutoValidate = widget.isAutoValidate;
    isReadOnly = widget.readOnly;
  }

  @override
  void dispose() {
    try {
      focusNode.dispose();
      controller.dispose();
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
    super.dispose();
  }

  void requestFocus() {
    focusNode.requestFocus();
  }

  bool get isValid => validatorValue.isValid();
  void validate({String? value}) {
    final validatorValue = widget.validator?.call(
      context,
      value ?? controller.text,
    );

    if (validatorValue?.showStatusMessage == ShowStatusMessage.error) {
      requestFocus();
      setState(() {
        isAutoValidate = true;
      });
    }

    if (validatorValue != null) {
      if (this.validatorValue != validatorValue) {
        setState(() {
          this.validatorValue = validatorValue;
        });
      }
    } else if (this.validatorValue.showStatusMessage !=
        ShowStatusMessage.none) {
      setState(() {
        this.validatorValue = ValidatorValue.none;
      });
    }
  }

  void setText(String value) {
    controller.text = value;
    if (isAutoValidate) validate(value: value);
    setState(() {});
  }

  void onChanged(String value) {
    if (isAutoValidate) validate(value: value);
    widget.onChanged?.call(value);
  }

  void onTap() {
    FocusManager.instance.primaryFocus?.unfocus();
    widget.onTap?.call();
  }

  void setReadOnly(bool value) {
    setState(() {
      isReadOnly = value;
    });
  }

  bool get isFocusOrFilled => isFocus || controller.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          key: widget.textfieldKey,
          controller: controller,
          enabled: widget.enabled,
          decoration: widget.decoration.copyWith(
            label: widget.title != null && isFocusOrFilled
                ? Text(
                    widget.title!,
                    style: context.bodyMedium?.copyWith(
                      color: validatorValue.showStatusMessage ==
                              ShowStatusMessage.error
                          ? Colors.red
                          : isFocus
                              ? Colors.blue
                              : Colors.grey,
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    key: widget.obscureIconKey,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: validatorValue.showStatusMessage ==
                          ShowStatusMessage.error
                      ? Colors.red
                      : Colors.grey,
                  width: 1),
              borderRadius: BorderRadius.circular(GitsSizes.s8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    validatorValue.showStatusMessage == ShowStatusMessage.error
                        ? Colors.red
                        : Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(GitsSizes.s8),
            ),
          ),
          onChanged: onChanged,
          inputFormatters: widget.inputFormatters,
          focusNode: focusNode,
          keyboardType: widget.keyboardType,
          autofocus: widget.autofocus,
          maxLength: widget.maxLength,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          minLines: widget.minLines,
          obscureText: obscureText,
          onSubmitted: widget.onSubmitted,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap != null ? onTap : null,
          readOnly: isReadOnly,
          style: widget.enabled ?? true
              ? widget.style
              : const TextStyle(color: Colors.grey),
          textAlign: widget.textAlign,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
        ),
        if (validatorValue.showStatusMessage == ShowStatusMessage.error)
          TextFieldMessage.error(
              context: context, text: validatorValue.message),
        if (validatorValue.showStatusMessage == ShowStatusMessage.info)
          TextFieldMessage.info(context: context, text: validatorValue.message),
        if (validatorValue.showStatusMessage == ShowStatusMessage.success)
          TextFieldMessage.success(
              context: context, text: validatorValue.message),
        if (validatorValue.showStatusMessage == ShowStatusMessage.warning)
          TextFieldMessage.warning(
              context: context, text: validatorValue.message),
      ],
    );
  }
}
''';

String codeSnippetExampleGitsTextField = ''' Scaffold(
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
    ); ''';
