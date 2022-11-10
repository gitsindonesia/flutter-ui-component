const String codeSnippetTextThemeExtension =
    '''import 'package:flutter/material.dart'
    show BuildContext, Theme, TextTheme, TextStyle;

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;

  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;

  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
}
''';

const String codeSnippetTextDisplayLarge = '''Text(
  'Display Large',
  style: context.displayLarge,
)''';

const String codeSnippetTextDisplayMedium = '''Text(
  'Display Medium',
  style: context.displayMedium,
)''';

const String codeSnippetTextDisplaySmall = '''Text(
  'Display Small',
  style: context.displaySmall,
)''';

const String codeSnippetTextHeadlineLarge = '''Text(
  'Headline Large',
  style: context.headlineLarge,
)''';

const String codeSnippetTextHeadlineMedium = '''Text(
  'Headline Medium',
  style: context.headlineMedium,
)''';

const String codeSnippetTextHeadlineSmall = '''Text(
  'Headline Small',
  style: context.headlineSmall,
)''';

const String codeSnippetTextTitleLarge = '''Text(
  'Title Large',
  style: context.titleLarge,
)''';

const String codeSnippetTextTitleMedium = '''Text(
  'Title Medium',
  style: context.titleMedium,
)''';

const String codeSnippetTextTitleSmall = '''Text(
  'Title Small',
  style: context.titleSmall,
)''';

const String codeSnippetTextLabelLarge = '''Text(
  'Label Large',
  style: context.labelLarge,
)''';

const String codeSnippetTextLabelMedium = '''Text(
  'Label Medium',
  style: context.labelMedium,
)''';

const String codeSnippetTextLabelSmall = '''Text(
  'Label Small',
  style: context.labelSmall,
)''';

const String codeSnippetTextBodyLarge = '''Text(
  'Body Large',
  style: context.bodyLarge,
)''';

const String codeSnippetTextBodyMedium = '''Text(
  'Body Medium',
  style: context.bodyMedium,
)''';

const String codeSnippetTextBodySmall = '''Text(
  'Body Small',
  style: context.bodySmall,
)''';
