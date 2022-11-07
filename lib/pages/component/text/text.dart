import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      children: [
        CardHighlight(
          codeSnippet: '''Text(
  'Display Large',
  style: context.displayLarge,
)''',
          child: Text(
            'Display Large',
            style: context.displayLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Display Medium',
  style: context.displayMedium,
)''',
          child: Text(
            'Display Medium',
            style: context.displayMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Display Small',
  style: context.displaySmall,
)''',
          child: Text(
            'Display Small',
            style: context.displaySmall,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Headline Large',
  style: context.headlineLarge,
)''',
          child: Text(
            'Headline Large',
            style: context.headlineLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Headline Medium',
  style: context.headlineMedium,
)''',
          child: Text(
            'Headline Medium',
            style: context.headlineMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Headline Small',
  style: context.headlineSmall,
)''',
          child: Text(
            'Headline Small',
            style: context.headlineSmall,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Title Large',
  style: context.titleLarge,
)''',
          child: Text(
            'Title Large',
            style: context.titleLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Title Medium',
  style: context.titleMedium,
)''',
          child: Text(
            'Title Medium',
            style: context.titleMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Title Small',
  style: context.titleSmall,
)''',
          child: Text(
            'Title Small',
            style: context.titleSmall,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Label Large',
  style: context.labelLarge,
)''',
          child: Text(
            'Label Large',
            style: context.labelLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Label Medium',
  style: context.labelMedium,
)''',
          child: Text(
            'Label Medium',
            style: context.labelMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Label Small',
  style: context.labelSmall,
)''',
          child: Text(
            'Label Small',
            style: context.labelSmall,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Body Large',
  style: context.bodyLarge,
)''',
          child: Text(
            'Body Large',
            style: context.bodyLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Body Medium',
  style: context.bodyMedium,
)''',
          child: Text(
            'Body Medium',
            style: context.bodyMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: '''Text(
  'Body Small',
  style: context.bodySmall,
)''',
          child: Text(
            'Body Small',
            style: context.bodySmall,
          ),
        ),
      ],
    );
  }
}
