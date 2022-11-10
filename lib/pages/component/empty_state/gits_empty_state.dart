import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsEmptyState extends StatelessWidget {
  const GitsEmptyState({
    Key? key,
    required this.text,
    this.description,
    this.padding = const EdgeInsets.all(GitsSizes.s16),
  }) : super(key: key);

  final String text;
  final String? description;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SvgPicture.asset(
                'assets/svg/empty-illustration.svg',
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            const GitsSpacing.vertical16(),
            Text(
              text,
              style: context.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (description != null) ...[
              const GitsSpacing.vertical4(),
              Text(
                description!,
                style: context.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
