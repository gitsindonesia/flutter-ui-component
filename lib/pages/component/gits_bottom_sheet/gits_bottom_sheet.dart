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
