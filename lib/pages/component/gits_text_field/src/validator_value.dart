import 'package:equatable/equatable.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';

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
