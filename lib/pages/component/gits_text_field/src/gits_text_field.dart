import 'package:flutter/foundation.dart';
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
