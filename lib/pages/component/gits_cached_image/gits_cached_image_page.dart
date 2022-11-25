import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_cached_image/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_cached_image/gits_cached_image.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_text_field/src/gits_text_field.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/gits_slider.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsCachedImagePage extends StatelessWidget {
  const GitsCachedImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Cached Image')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsCachedImage,
          child: const ShortDescription(
            title: 'Gits Cached Image',
            description: 'Create component widget',
          ),
        ),
        DeviceHighlight(
            codeSnippet: codeSnippetExampleGitsCachedImagePage,
            builder: (context) => const ExampleGitsCachedImagePage())
      ],
    );
  }
}

class ExampleGitsCachedImagePage extends StatefulWidget {
  const ExampleGitsCachedImagePage({super.key});

  @override
  State<ExampleGitsCachedImagePage> createState() =>
      _ExampleGitsCachedImagePageState();
}

class _ExampleGitsCachedImagePageState
    extends State<ExampleGitsCachedImagePage> {
  double imageSize = 100;
  Map<String, BoxFit> boxFit = {
    'contain': BoxFit.contain,
    'cover': BoxFit.cover,
    'fill': BoxFit.fill,
    'fitHeight': BoxFit.fitHeight,
    'fitWidth': BoxFit.fitWidth,
    'none': BoxFit.none,
    'scaleDown': BoxFit.scaleDown,
  };
  String selectedBoxFit = 'cover';
  String urlImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Cached Image')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GitsCachedImageCircle(
                imageUrl: urlImage,
                width: imageSize,
                height: imageSize,
                fit: boxFit[selectedBoxFit],
              ),
              const GitsSpacing.vertical16(),
              GitsCachedImageRounded(
                imageUrl: urlImage,
                width: imageSize,
                height: imageSize,
                fit: boxFit[selectedBoxFit],
              ),
              const GitsSpacing.vertical16(),
              GitsTextField(
                title: 'Url Image',
                onChanged: (value) => setState(() {
                  urlImage = value;
                }),
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: 'Masukan url image',
                ),
              ),
              const GitsSpacing.vertical16(),
              GitsSlider(
                title: 'Image Circle Size',
                value: imageSize,
                max: 100,
                onChanged: (value) => setState(() {
                  imageSize = value;
                }),
              ),
              const GitsSpacing.vertical16(),
              CardProperties(
                title: 'Box Fit',
                selected: selectedBoxFit,
                items: boxFit.keys.toList(),
                onChanged: (value) => setState(() {
                  selectedBoxFit = value;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
