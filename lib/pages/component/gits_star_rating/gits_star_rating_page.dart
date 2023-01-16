import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_star_rating/code_snippet.dart';

import '../../../widgets/card_highlight.dart';
import '../../../widgets/device_highlight.dart';
import '../../../widgets/gits_spacing.dart';
import '../../../widgets/scaffold_page.dart';
import '../../../widgets/short_description.dart';
import 'gits_star_rating.dart';

class GitsStarRatingPage extends StatelessWidget {
  const GitsStarRatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Search')),
      children: [
        const CardHighlight(
          codeSnippet: codeSnippetGitsStarRating,
          child: ShortDescription(
            title: 'Gits Search',
            description: 'Create component gits search',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsStarRating,
          builder: (context) => const ExampleGitsStarRating(),
        )
      ],
    );
  }
}

class ExampleGitsStarRating extends StatefulWidget {
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
                    "Rating : $rating",
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
}
