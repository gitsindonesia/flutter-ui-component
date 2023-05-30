
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gits_extension/gits_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_chips_input/widgets/gits_chips_input.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/src/gits_text_field.dart';

part 'chips_input_state.dart';

class ChipsInputCubit extends Cubit<ChipsInputStateCubit> {
  ChipsInputCubit() : super(const ChipsInputStateCubit());

  /// key of textField
  final chipKey = GlobalKey<GitsTextFieldState>();

  void initialChips(List<String>? value) {
    if ((value ?? []).isNotEmpty) {
      emit(state.copyWith(
        dataChips: value!.map((e) => e.toLowerCase()).toList(),
      ));
    }
  }

  void insertChips({
    required String? value,
    required StringListCallback callback,
  }) {
    if (value.isNotNullOrEmpty) {
      chipKey.currentState?.setText('');
      List<String> result = state.dataChips ?? [];
      result.add(value ?? '');
      callback(result);
      emit(state.copyWith(dataChips: result));
    }
  }

  void deleteChips({
    required String? value,
    required StringListCallback callback,
  }) {
    if (value.isNotNullOrEmpty) {
      List<String> result = state.dataChips ?? [];
      result.remove(value ?? '');
      callback(result);
      emit(state.copyWith(dataChips: result));
    }
  }

  void changeFocus(bool? value) {
    emit(state.copyWith(hasFocus: value));
  }
}
