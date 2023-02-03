import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_cached_image/gits_cached_image.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_carousel/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_carousel/gits_carousel.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsSliderPage extends StatelessWidget {
  const GitsSliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Carousel')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetIndicatorCarousel,
          child: const ShortDescription(
            title: 'Indicator Carousel',
            description: 'Create component indicator carousel',
          ),
        ),
        CardHighlight(
          codeSnippet: codeSnippetGitsCarousel,
          child: const ShortDescription(
            title: 'Gits Carousel',
            description: 'Create component gits carousel',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsCarousel,
          builder: (context) => const ExampleGitsSliderPage(),
        )
      ],
    );
  }
}

class ExampleGitsSliderPage extends StatefulWidget {
  const ExampleGitsSliderPage({super.key});

  @override
  State<ExampleGitsSliderPage> createState() => _ExampleGitsSliderPageState();
}

class _ExampleGitsSliderPageState extends State<ExampleGitsSliderPage> {
  final data = [
    "https://thumbs.dreamstime.com/b/movie-slate-film-reel-wood-clapper-wooden-backgorund-36502412.jpg",
    "https://cdn.pixabay.com/photo/2016/01/22/08/20/film-1155439_1280.jpg",
    "https://m.media-amazon.com/images/M/MV5BNzQxNzQxNjk5NV5BMl5BanBnXkFtZTgwNTI4MTU0MzE@._V1_.jpg",
  ];
  int indicatorSelected = 0;

  @override
  Widget build(BuildContext context) {
    final releaseTodayController = PageController();

    return Scaffold(
      appBar: AppBar(title: const Text('Example Gits Carousel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsCarousel(
              title: "Example Carousel",
              pageController: releaseTodayController,
              itemCount: data.length,
              indicatorSelected: 2,
              itemBuilder: (context, index) {
                return GitsCachedImageRounded(
                  imageUrl: data[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
