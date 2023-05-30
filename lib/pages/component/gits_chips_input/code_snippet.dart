String codeSnippetGitsChipsInput = ''' 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gits_extension/gits_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_chips_input/cubit/chips_input_cubit.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_status_message/gits_status_message.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/src/gits_text_field.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/src/validator_value.dart';

typedef ChipsBuilder<T> = Widget Function(BuildContext context, T data);
typedef StringListCallback = Function(List<String> value);

class GitsChipsInput extends StatefulWidget {
  final ChipsBuilder chipBuilder;
  final List<String> initialData;
  final StringListCallback callback;

  const GitsChipsInput({
    Key? key,
    required this.chipBuilder,
    required this.initialData,
    required this.callback,
  }) : super(key: key);

  @override
  State<GitsChipsInput> createState() => _GitsChipsInputState();
}

class _GitsChipsInputState extends State<GitsChipsInput> {

  ValidatorValue validatorValue = ValidatorValue.none;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChipsInputCubit, ChipsInputStateCubit>(
        builder: (contextParent, state) {
          final chipKey =
          contextParent.select((ChipsInputCubit element) => element.chipKey);

          final List<Widget> chipsChildren = (state.dataChips ?? [])
              .map<Widget>((data) => widget.chipBuilder(context, data))
              .toList();

          return Focus(
            onFocusChange: (hasFocus) {
              context.read<ChipsInputCubit>().changeFocus(hasFocus);
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: state.hasFocus == true
                          ? Colors.blue
                          : Colors.grey.withOpacity(0.7),
                      width: state.hasFocus == true ? 1 : 0.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// chips list
                      Container(
                        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 4.0,
                          runSpacing: 4.0,
                          children: chipsChildren,
                        ),
                      ),

                      /// textField
                      Padding(
                        padding:
                        EdgeInsets.only(bottom:5, top:chipsChildren.isEmpty?0:5, left: 5, right: 5,),
                        child: GitsTextField(
                          key: chipKey,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'Enter email',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.email_outlined),
                              onPressed: () {},
                            ),
                            border: _border(),
                            enabledBorder: _border(),
                            focusedBorder: _border(),
                          ),
                          onChanged: (text) {
                            /// if the word contains spaces and does not match the email criteria
                            if (text.contains(' ') &&
                                !text.toString().trim().isEmail) {
                              /// set validation
                              setState(() {
                                validatorValue = const ValidatorValue(
                                  message: 'Incorrect email format',
                                  showStatusMessage: ShowStatusMessage.error,
                                );
                              });
                            }

                            /// if the word contains spaces and matches the email criteria
                            if (text.contains(' ') &&
                                text.toString().trim().isEmail) {
                              /// insert text to chips list in cubit
                              context.read<ChipsInputCubit>().insertChips(
                                value: text.toLowerCase().trim(),
                                callback: widget.callback,
                              );

                              /// set validation
                              setState(() {
                                validatorValue = ValidatorValue.none;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                /// validation
                if (validatorValue.showStatusMessage == ShowStatusMessage.error)
                  GitsStatusMessage.error(
                    context: context,
                    text: validatorValue.message,
                  ),
              ],
            ),
          );
        }
    );
  }

  OutlineInputBorder _border() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 1,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GitsChipsItem extends StatelessWidget {
  const GitsChipsItem({
    Key? key,
    required this.label,
    this.onDeleted,
  }) : super(key: key);

  final String label;
  final ValueChanged<String>? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      deleteIcon: const Icon(
        Icons.close,
        color: Colors.blue,
        size: 18,
      ),
      onDeleted: () => onDeleted?.call(label),
    );
  }
}

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

part of 'chips_input_cubit.dart';

class ChipsInputStateCubit {
  const ChipsInputStateCubit({
    this.dataChips,
    this.hasFocus,
  });

  final List<String>? dataChips;
  final bool? hasFocus;

  ChipsInputStateCubit copyWith({
    List<String>? dataChips,
    bool? hasFocus,
  }) {
    return ChipsInputStateCubit(
      dataChips: dataChips ?? this.dataChips,
      hasFocus: hasFocus ?? this.hasFocus,
    );
  }
}

''';

String codeSnippetExampleGitsChipsInput = '''  BlocProvider(
      create: (_) => ChipsInputCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Example Gits Chips Input"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GitsChipsInput(
            initialData: const [],
            callback: (value) {
              /// here is the change data list
            },
            chipBuilder: (BuildContext context, data) {
              return GitsChipsItem(
                label: data,
                onDeleted: (label) {
                  context.read<ChipsInputCubit>().deleteChips(
                    value: label.toLowerCase().trim(),
                    callback: (value) {
                      /// here is the change data list
                      /// after user remove the chips
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    ); ''';
