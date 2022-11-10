import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_divider_dash/gits_divider_dash.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_slider.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

import 'code_snippet.dart';

class GitsDividerDashPage extends StatelessWidget {
  const GitsDividerDashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Divider Dash')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsDividerDash,
          child: Column(
            children: const [
              ShortDescription(
                title: 'GitsDividerDash',
                description: '',
              ),
            ],
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsDividerDash,
          builder: (context) => const ExampleGitsDividerDash(),
        ),
      ],
    );
  }
}

class ExampleGitsDividerDash extends StatefulWidget {
  const ExampleGitsDividerDash({super.key});

  @override
  State<ExampleGitsDividerDash> createState() => _ExampleGitsDividerDashState();
}

class _ExampleGitsDividerDashState extends State<ExampleGitsDividerDash> {
  double thickness = 2;
  double dashWidth = 4;
  double dashGap = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('default'),
            const GitsSpacing.vertical8(),
            const GitsDividerDash(),
            const GitsSpacing.vertical16(),
            const Text('custom dash'),
            const GitsSpacing.vertical8(),
            GitsSlider(
              title: 'thickness',
              value: thickness,
              max: 10,
              onChanged: (value) => setState(() {
                thickness = value;
              }),
            ),
            GitsSlider(
              title: 'dash width',
              value: dashWidth,
              max: 10,
              onChanged: (value) => setState(() {
                dashWidth = value;
              }),
            ),
            GitsSlider(
              title: 'dash gap',
              value: dashGap,
              max: 30,
              onChanged: (value) => setState(() {
                dashGap = value;
              }),
            ),
            GitsDividerDash(
              thickness: thickness,
              dashWidth: dashWidth,
              dashGap: dashGap,
            ),
          ],
        ),
      ),
    );
  }
}
