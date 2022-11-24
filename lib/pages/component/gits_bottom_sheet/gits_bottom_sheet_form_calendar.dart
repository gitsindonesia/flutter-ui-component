import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gits_extension/gits_extension.dart';
import 'package:gits_flutter_ui_component/constants/gits_icon.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_app_bar.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_calendar.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/gits_text_field.dart';
import 'package:gits_flutter_ui_component/pages/extension/date_time_extension.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

enum ButtonDateType { form, calendar }

class GitsBottomSheetFormCalendar extends StatefulWidget {
  const GitsBottomSheetFormCalendar({
    Key? key,
    this.firstDay,
    this.lastDay,
    this.initialStartDate,
    this.initialEndDate,
    required this.onSaved,
    this.onCanceled,
  }) : super(key: key);

  final DateTime? firstDay;
  final DateTime? lastDay;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Function(DateTime startDate, DateTime endDate) onSaved;
  final GestureTapCallback? onCanceled;

  @override
  State<GitsBottomSheetFormCalendar> createState() =>
      _GitsBottomSheetFormCalendarState();
}

class _GitsBottomSheetFormCalendarState
    extends State<GitsBottomSheetFormCalendar> {
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  final DateTime now = DateTime.now();
  ButtonDateType type = ButtonDateType.form;
  bool isStartDate = true;
  DateTime selectedDay = DateTime.now();

  bool isStartDateValid = true;
  DateTime? resultStartDate;
  DateTime? resultEndDate;

  @override
  void initState() {
    super.initState();
    widget.initialStartDate?.run((it) {
      startDateController.text = it.toFormatDate();
      resultStartDate = it;
    });
    widget.initialEndDate?.run((it) {
      endDateController.text = it.toFormatDate();
      resultEndDate = it;
    });
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  void validation() => setState(() {
        isStartDateValid = startDateController.text.isEmpty ? false : true;
      });

  bool isValid() => isStartDateValid;

  InputBorder getInputBorder(bool isValid) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isValid ? Colors.grey : Colors.red,
      ),
      borderRadius: BorderRadius.circular(GitsSizes.s8),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (type == ButtonDateType.calendar) {
      DateTime firstDay =
          widget.firstDay ?? DateTime(now.year - 5, now.month, now.day);
      DateTime lastDay = widget.lastDay ?? now.lastDayOfMonth;
      if (!isStartDate) {
        resultStartDate?.run((it) {
          firstDay = it;
        });
      }
      return GitsBottomSheetCalendar(
        firstDay: firstDay,
        lastDay: lastDay,
        initialDate: isStartDate ? resultStartDate : resultEndDate,
        onCancel: () => setState(() => type = ButtonDateType.form),
        onSelect: (date) => setState(() {
          type = ButtonDateType.form;
          if (isStartDate) {
            resultStartDate = date;
            startDateController.text = date.toFormatDate();
            resultEndDate?.run((it) {
              if (date.isAfter(it)) {
                endDateController.clear();
                resultEndDate = null;
              }
            });
          } else {
            resultEndDate = date;
            endDateController.text = date.toFormatDate();
          }
        }),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const GitsBottomSheetAppbar(title: 'Pilih Periode'),
        Padding(
          padding: const EdgeInsets.all(GitsSizes.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                readOnly: true,
                controller: startDateController,
                decoration: InputDecoration(
                  border: getInputBorder(isStartDateValid),
                  focusedBorder: getInputBorder(isStartDateValid),
                  enabledBorder: getInputBorder(isStartDateValid),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(GitsSizes.s12),
                    child: SvgPicture.asset(
                      GitsIcons.calendar,
                      color: isStartDateValid ? Colors.blue : Colors.red,
                    ),
                  ),
                  hintText: 'Pilih Dari Tanggal',
                ),
                onTap: () => setState(() {
                  isStartDateValid = true;
                  isStartDate = true;
                  type = ButtonDateType.calendar;
                }),
              ),
              if (!isStartDateValid)
                TextFieldMessage.error(
                    context: context,
                    text: 'Pilih dari tanggal periode harus diisi'),
              const GitsSpacing.vertical16(),
              TextField(
                readOnly: true,
                controller: endDateController,
                decoration: InputDecoration(
                  border: getInputBorder(true),
                  focusedBorder: getInputBorder(true),
                  enabledBorder: getInputBorder(true),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(GitsSizes.s12),
                    child: SvgPicture.asset(
                      GitsIcons.calendar,
                      color: Colors.blue,
                    ),
                  ),
                  hintText: 'Pilih Sampai Tanggal',
                ),
                onTap: () => setState(() {
                  isStartDate = false;
                  type = ButtonDateType.calendar;
                }),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(GitsSizes.s16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GitsButton.outlined(
                  text: 'Batal',
                  onPressed: () =>
                      widget.onCanceled ?? () => Navigator.of(context).pop(),
                ),
              ),
              const GitsSpacing.horizontal16(),
              Expanded(
                child: GitsButton.elevated(
                  text: 'Simpan',
                  onPressed: () {
                    validation();
                    if (isValid()) {
                      widget.onSaved(
                        resultStartDate!,
                        resultEndDate ?? resultStartDate!,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
