part of 'global_cubit.dart';

class GlobalState {
  const GlobalState({
    required this.themeMode,
    required this.themeModeSimulation,
    required this.orientationSimulation,
    required this.isFrameVisibleSimulation,
    required this.deviceInfoSimulation,
  });

  final ThemeMode themeMode;
  final ThemeMode themeModeSimulation;
  final Orientation orientationSimulation;
  final bool isFrameVisibleSimulation;
  final DeviceInfo deviceInfoSimulation;

  GlobalState copyWith({
    ThemeMode? themeMode,
    ThemeMode? themeModeSimulation,
    Orientation? orientationSimulation,
    bool? isFrameVisibleSimulation,
    DeviceInfo? deviceInfoSimulation,
  }) {
    return GlobalState(
      themeMode: themeMode ?? this.themeMode,
      themeModeSimulation: themeModeSimulation ?? this.themeModeSimulation,
      orientationSimulation:
          orientationSimulation ?? this.orientationSimulation,
      isFrameVisibleSimulation:
          isFrameVisibleSimulation ?? this.isFrameVisibleSimulation,
      deviceInfoSimulation: deviceInfoSimulation ?? this.deviceInfoSimulation,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalState &&
        other.themeMode == themeMode &&
        other.themeModeSimulation == themeModeSimulation &&
        other.orientationSimulation == orientationSimulation &&
        other.isFrameVisibleSimulation == isFrameVisibleSimulation &&
        other.deviceInfoSimulation == deviceInfoSimulation;
  }

  @override
  int get hashCode {
    return themeMode.hashCode ^
        themeModeSimulation.hashCode ^
        orientationSimulation.hashCode ^
        isFrameVisibleSimulation.hashCode ^
        deviceInfoSimulation.hashCode;
  }
}
