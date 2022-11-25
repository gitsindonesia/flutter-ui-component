String codeSnippetGitsBottomSheetAppBar = ''' 
import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsBottomSheetAppbar extends StatelessWidget {
  final String? title;
  final Key? closeKey;

  const GitsBottomSheetAppbar({super.key, this.title, this.closeKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              key: closeKey ?? const ValueKey('iconClose'),
              onPressed: () => Navigator.maybeOf(context)?.pop(),
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
            const GitsSpacing.horizontal8(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: GitsSizes.s16),
                child: Text(
                  title!,
                  style: context.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 1, thickness: 1),
      ],
    );
  }
}
''';

String codeSnippetGitsBottomSheetCalendar = ''' 
import 'package:flutter/material.dart';
import 'package:gits_extension/gits_extension.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_calendar/gits_calendar.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsBottomSheetCalendar extends StatefulWidget {
  const GitsBottomSheetCalendar({
    Key? key,
    this.initialDate,
    required this.firstDay,
    required this.lastDay,
    required this.onCancel,
    required this.onSelect,
  }) : super(key: key);

  final DateTime? initialDate;
  final DateTime firstDay;
  final DateTime lastDay;
  final GestureTapCallback onCancel;
  final ValueChanged<DateTime> onSelect;

  @override
  State<GitsBottomSheetCalendar> createState() =>
      _GitsBottomSheetCalendarState();
}

class _GitsBottomSheetCalendarState extends State<GitsBottomSheetCalendar> {
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GitsCalendar(
          initialDate: widget.initialDate,
          firstDay: widget.firstDay,
          lastDay: widget.lastDay,
          onDateChanged: (time) => setState(() => _selectedDay = time),
        ),
        const GitsSpacing.vertical24(),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(GitsSizes.s16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GitsButton.outlined(
                  text: 'Batal',
                  onPressed: widget.onCancel,
                ),
              ),
              const GitsSpacing.horizontal16(),
              Expanded(
                child: GitsButton.elevated(
                  text: 'Simpan',
                  onPressed: () {
                    _selectedDay?.run((it) {
                      widget.onSelect(it);
                    });
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

''';

String codeSnippetGitsBottomSheetExtension = ''' 
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

''';

String codeSnippetGitsBottomSheetFormCalendar = ''' 
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

''';

String codeSnippetGitsBottomSheetSuccess =
    ''' import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/constants/gits_svg.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_button/gits_button.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsBottomSheetSuccess extends StatelessWidget {
  const GitsBottomSheetSuccess({
    Key? key,
    this.buttonKey,
    required this.title,
    this.message,
    required this.buttonText,
    this.onButtonPressed,
    this.customMessage,
  })  : assert(message != null || customMessage != null),
        super(key: key);

  final Key? buttonKey;
  final String title;
  final String? message;
  final String buttonText;
  final GestureTapCallback? onButtonPressed;
  final Widget? customMessage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(GitsSizes.s16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            GitsSvg.successIllustration,
            height: 180,
            fit: BoxFit.fitHeight,
          ),
          const GitsSpacing.vertical32(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const GitsSpacing.vertical8(),
          if (customMessage != null)
            customMessage!
          else
            Text(
              message ?? '',
              textAlign: TextAlign.center,
              style: context.bodyMedium,
            ),
          const GitsSpacing.vertical32(),
          GitsButton.elevated(
            key: buttonKey ?? const ValueKey("btnOke"),
            text: buttonText,
            onPressed: () {
              Navigator.maybeOf(context)?.pop();
              onButtonPressed?.call();
            },
          ),
        ],
      ),
    );
  }
}
''';

String codeSnippetGitsBottomSheet = ''' 
import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_bottom_sheet/gits_bottom_sheet_app_bar.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsBottomSheet extends StatelessWidget {
  const GitsBottomSheet({
    Key? key,
    this.title,
    this.closeKey,
    this.constraints,
    required this.child,
  }) : super(key: key);

  final String? title;
  final Key? closeKey;
  final BoxConstraints? constraints;
  final Widget child;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    Key? key,
    Key? closeKey,
    String? title,
    BoxConstraints? constraints,
    bool isScrollControlled = true,
    bool isDismissible = true,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(GitsSizes.s16),
          topRight: Radius.circular(GitsSizes.s16),
        ),
      ),
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      constraints: constraints ??
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 90),
      builder: (context) => GitsBottomSheet(
        key: key,
        title: title,
        constraints: constraints,
        closeKey: closeKey,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                GitsSizes.s16, GitsSizes.s16, GitsSizes.s16, 0),
            child: Container(
              width: GitsSizes.s60,
              height: GitsSizes.s4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(GitsSizes.s4),
              ),
            ),
          ),
          if (title != null)
            GitsBottomSheetAppbar(
              closeKey: closeKey,
              title: title,
            )
          else
            const GitsSpacing.vertical16(),
          Flexible(child: child),
        ],
      ),
    );
  }
}
''';

String codeSnippetExampleGitsBottomSheetPage = '''  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsButton.elevated(
                onPressed: () => context.showBottomSheet(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Widget Bebas"),
                        Text("Widget Bebas"),
                        Text("Widget Bebas"),
                      ],
                    ),
                    title: "Custom Bottom Sheet"),
                text: "Custom Bottom Sheet"),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Range Calendar Bottom Sheet",
              onPressed: () => context.showButtonSheetFormCalendar(
                firstDay: DateTime(now.year - 5, now.month, now.day),
                lastDay: now,
                onCanceled: () => Navigator.pop(context),
                onSaved: (startDate, endDate) => Navigator.pop(context),
              ),
            ),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Calendar Bottom Sheet",
              onPressed: () => context.showButtonSheetCalendar(
                  firstDay: DateTime(now.year - 5, now.month, now.day),
                  lastDay: now,
                  onCancel: () => Navigator.pop(context),
                  onSelect: (value) => Navigator.pop(context)),
            ),
            const GitsSpacing.vertical16(),
            GitsButton.elevated(
              text: "Success Buttom Sheet",
              onPressed: () => context.showButtonSheetSuccess(
                  title: "Registrasi Berhasil",
                  successButtonText: "Oke",
                  successMessage:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
            )
          ],
        ),
      ),
    ); ''';
