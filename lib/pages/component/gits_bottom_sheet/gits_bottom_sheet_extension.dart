import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_calendar.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_form_calendar.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_success.dart';

extension BottomSheetExtension on BuildContext {
  Future<T?> showBottomSheet<T>({
    required Widget child,
    Key? key,
    Key? closeKey,
    String? title,
    BoxConstraints? constraints,
    bool isScrollControlled = true,
    bool isDismissible = true,
  }) {
    return GitsBottomSheet.show(
      context: this,
      key: key,
      closeKey: closeKey,
      constraints: constraints,
      title: title,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      child: child,
    );
  }

  Future<T?> showButtonSheetSuccess<T>({
    Key? key,
    Key? closeKey,
    BoxConstraints? constraints,
    bool isScrollControlled = true,
    bool isDismissible = true,
    required String title,
    required String successButtonText,
    String? successMessage,
    GestureTapCallback? onSuccessButtonPressed,
    Widget? customSuccessMessage,
  }) {
    return GitsBottomSheet.show(
      context: this,
      key: key,
      closeKey: closeKey,
      constraints: constraints,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      child: GitsBottomSheetSuccess(
        title: title,
        buttonText: successButtonText,
        customMessage: customSuccessMessage,
        onButtonPressed: onSuccessButtonPressed,
        message: successMessage,
      ),
    );
  }

  Future<T?> showButtonSheetCalendar<T>({
    Key? key,
    Key? closeKey,
    BoxConstraints? constraints,
    bool isScrollControlled = true,
    bool isDismissible = true,
    required DateTime firstDay,
    required DateTime lastDay,
    required GestureTapCallback onCancel,
    required ValueChanged<DateTime> onSelect,
  }) {
    return GitsBottomSheet.show(
      context: this,
      key: key,
      closeKey: closeKey,
      constraints: constraints,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      child: GitsBottomSheetCalendar(
        firstDay: firstDay,
        lastDay: lastDay,
        onCancel: onCancel,
        onSelect: onSelect,
      ),
    );
  }

  Future<T?> showButtonSheetFormCalendar<T>({
    Key? key,
    Key? closeKey,
    BoxConstraints? constraints,
    bool isScrollControlled = true,
    bool isDismissible = true,
    DateTime? firstDay,
    DateTime? lastDay,
    GestureTapCallback? onCanceled,
    required Function(DateTime startDate, DateTime endDate) onSaved,
  }) {
    return GitsBottomSheet.show(
      context: this,
      key: key,
      closeKey: closeKey,
      constraints: constraints,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      child: GitsBottomSheetFormCalendar(
        firstDay: firstDay,
        lastDay: lastDay,
        onCanceled: onCanceled,
        onSaved: onSaved,
      ),
    );
  }
}
