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
