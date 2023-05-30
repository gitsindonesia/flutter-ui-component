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
