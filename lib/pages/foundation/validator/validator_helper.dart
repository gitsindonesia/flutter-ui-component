import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';

abstract class ValidatorValueHelper {
  static ValidatorValue? validatorEmail(BuildContext context, String value) {
    if (value.isEmpty) {
      return const ValidatorValue(
        message: 'Email harus diisi',
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (value.length >= 50) {
      return const ValidatorValue(
        message: 'Email maksimal 50 karakter',
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
      return const ValidatorValue(
        message: 'Email yang Anda masukan tidak sah',
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }

  static ValidatorValue? validatorPIN(BuildContext context, String value) {
    RegExp regExp = RegExp(r'^[0-9]+$');

    if (value.isEmpty) {
      return const ValidatorValue(
        message: 'Pin harus diisi',
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (!regExp.hasMatch(value)) {
      return const ValidatorValue(
        message: 'Masukan Pin dengan format angka',
        showStatusMessage: ShowStatusMessage.error,
      );
    } else if (value.length != 6) {
      return const ValidatorValue(
        message: 'Pin harus 6 digit',
        showStatusMessage: ShowStatusMessage.error,
      );
    }
    return null;
  }
}
