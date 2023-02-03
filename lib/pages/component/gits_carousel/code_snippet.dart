String codeSnippetGitsCarousel = '''import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_carousel/indicator_carousel.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class GitsCarousel extends StatefulWidget {
  const GitsCarousel({
    super.key,
    required this.itemBuilder,
    required this.indicatorSelected,
    this.pageController,
    this.itemCount,
    required this.title,
    this.colorText,
  });

  final String title;
  final PageController? pageController;
  final IndexedWidgetBuilder itemBuilder;
  final int indicatorSelected;
  final int? itemCount;
  final Color? colorText;

  @override
  State<GitsCarousel> createState() => _GitsCarouselState();
}

class _GitsCarouselState extends State<GitsCarousel> {
  int selected = 0;

  @override
  void initState() {
    setState(() {
      selected = widget.indicatorSelected;
    });
    super.initState();
  }

  void changePage(int value) {
    setState(() {
      selected = value;
      widget.pageController?.animateToPage(
        value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: context.bodyLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: widget.colorText ?? Colors.white,
          ),
        ),
        const GitsSpacing.vertical16(),
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: widget.itemCount,
            onPageChanged: changePage,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        const GitsSpacing.vertical16(),
        IndicatorCarousel(
          length: widget.itemCount ?? 0,
          selected: selected,
          onTap: changePage,
        ),
      ],
    );
  }
}
''';
String codeSnippetIndicatorCarousel = '''import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';

class IndicatorCarousel extends StatelessWidget {
  const IndicatorCarousel({
    super.key,
    required this.length,
    required this.selected,
    required this.onTap,
  });

  final int length;
  final int selected;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        length,
        (index) => InkWell(
          onTap: () => onTap(index),
          child: Container(
            key: Key('dotIndex'),
            margin: const EdgeInsets.all(GitsSizes.s4),
            width: index == selected ? GitsSizes.s24 : GitsSizes.s8,
            height: GitsSizes.s8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(GitsSizes.s80),
              color: index == selected ? Colors.black : Colors.grey,
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ),
    );
  }
}

''';
String codeSnippetExampleGitsCarousel =
    '''class ExampleGitsSliderPage extends StatefulWidget {
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
''';
