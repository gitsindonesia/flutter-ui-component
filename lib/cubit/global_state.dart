part of 'global_cubit.dart';

class GlobalState {
  const GlobalState({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  GlobalState copyWith({
    ThemeMode? themeMode,
  }) {
    return GlobalState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalState && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}
