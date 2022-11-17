import 'package:equatable/equatable.dart';
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
