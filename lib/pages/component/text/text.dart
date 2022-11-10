import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/text/code_snippet.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetTextThemeExtension,
          child: ShortDescription(
            title: 'Text Theme Extension',
            description: 'Create extension for TextTheme',
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextDisplayLarge,
          child: Text(
            'Display Large',
            style: context.displayLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextDisplayMedium,
          child: Text(
            'Display Medium',
            style: context.displayMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextDisplaySmall,
          child: Text(
            'Display Small',
            style: context.displaySmall,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextHeadlineLarge,
          child: Text(
            'Headline Large',
            style: context.headlineLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextHeadlineMedium,
          child: Text(
            'Headline Medium',
            style: context.headlineMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextHeadlineSmall,
          child: Text(
            'Headline Small',
            style: context.headlineSmall,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextTitleLarge,
          child: Text(
            'Title Large',
            style: context.titleLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextTitleMedium,
          child: Text(
            'Title Medium',
            style: context.titleMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextTitleSmall,
          child: Text(
            'Title Small',
            style: context.titleSmall,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextLabelLarge,
          child: Text(
            'Label Large',
            style: context.labelLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextLabelMedium,
          child: Text(
            'Label Medium',
            style: context.labelMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextLabelSmall,
          child: Text(
            'Label Small',
            style: context.labelSmall,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextBodyLarge,
          child: Text(
            'Body Large',
            style: context.bodyLarge,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextBodyMedium,
          child: Text(
            'Body Medium',
            style: context.bodyMedium,
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetTextBodySmall,
          child: Text(
            'Body Small',
            style: context.bodySmall,
          ),
        ),
      ],
    );
  }
}
