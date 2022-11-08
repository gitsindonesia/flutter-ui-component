import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit()
      : super(GlobalState(
          themeMode: ThemeMode.light,
          themeModeSimulation: ThemeMode.light,
          orientationSimulation: Orientation.portrait,
          isFrameVisibleSimulation: true,
          deviceInfoSimulation: Devices.ios.iPhone13,
        ));

  void toggleDarkMode() {
    emit(
      state.copyWith(
        themeMode: state.themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark,
      ),
    );
  }

  void setThemeModeSimulation(ThemeMode themeMode) {
    emit(state.copyWith(themeModeSimulation: themeMode));
  }

  void setOrientationSimulation(Orientation orientation) {
    emit(state.copyWith(orientationSimulation: orientation));
  }

  void setFrameVisibleSimulation(bool isFrameVisible) {
    emit(state.copyWith(isFrameVisibleSimulation: isFrameVisible));
  }

  void setDeviceInfoSimulation(DeviceInfo isDeviceInfo) {
    emit(state.copyWith(deviceInfoSimulation: isDeviceInfo));
  }
}
