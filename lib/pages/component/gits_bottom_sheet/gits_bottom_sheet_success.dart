import 'package:flutter/material.dart';
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
