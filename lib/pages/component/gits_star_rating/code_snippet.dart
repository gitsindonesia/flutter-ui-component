const String codeSnippetGitsStarRating =
    '''import 'package:flutter/material.dart';
import '../../../constants/gits_images.dart';

class StarModel {
  final int index;
  final String image;
  StarModel({
    required this.index,
    required this.image,
  });
}

class GitsStarRating extends StatefulWidget {
  final int? starRating;
  final MainAxisAlignment? mainAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final double scale;
  final bool? isTap;
  final Function(int)? result;
  const GitsStarRating(
      {Key? key,
      this.starRating = 0,
      this.padding,
      required this.scale,
      this.mainAxisAlignment,
      this.isTap = false,
      this.result})
      : super(key: key);

  @override
  State<GitsStarRating> createState() => _GitsStarRatingState();
}

class _GitsStarRatingState extends State<GitsStarRating> {
  List<StarModel> listStar = [];
  @override
  void initState() {
    super.initState();
    addStarRating(widget.starRating!);
  }

  addStarRating(int? totalStar) {
    setState(() {
      listStar.clear();
      if (totalStar != null) {
        for (var i = 1; i < 6; i++) {
          if (i <= totalStar) {
            listStar.add(StarModel(image: GitsImages.starYellow, index: i));
          } else {
            listStar.add(StarModel(image: GitsImages.starGrey, index: i));
          }
        }
      } else {
        for (var i = 1; i < 6; i++) {
          listStar
              .add(StarModel(image: GitsImages.starGrey, index: i));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        children: listStar
            .map((e) => Padding(
                  padding: widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: widget.isTap!
                        ? () {
                            addStarRating(e.index);
                            widget.result!(e.index);
                          }
                        : null,
                    child: Image.asset(
                      e.image,
                      scale: widget.scale,
                    ),
                  ),
                ))
            .toList());
  }
}
''';

String codeSnippetExampleGitsStarRating = '''class ExampleGitsStarRating extends StatefulWidget {
  const ExampleGitsStarRating({super.key});

  @override
  State<ExampleGitsStarRating> createState() => _ExampleGitsStarRatingState();
}

class _ExampleGitsStarRatingState extends State<ExampleGitsStarRating> {

  int rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Example Gits Star Rating')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Penilaian",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const GitsSpacing.vertical16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  GitsStarRating(
                    isTap: true,
                    scale: 4.5,
                    starRating: rating,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    mainAxisAlignment: MainAxisAlignment.center,
                    result: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                  const GitsSpacing.vertical16(),
                  Text(
                    "Rating : rating",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}''';
