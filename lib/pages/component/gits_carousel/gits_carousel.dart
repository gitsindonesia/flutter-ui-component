import 'package:flutter/material.dart';
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
