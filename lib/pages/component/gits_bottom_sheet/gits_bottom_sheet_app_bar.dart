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
