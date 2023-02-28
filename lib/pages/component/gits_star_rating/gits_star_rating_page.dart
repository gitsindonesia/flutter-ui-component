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
  double rating = 3.0;
  double inputRating = 0.0;
  var ratingController = TextEditingController(text: "0.0");

  feedbackValue(int value) {
    switch (value) {
      case 1:
        return "Sangat Kurang";
      case 2:
        return "Kurang";
      case 3:
        return "Cukup";
      case 4:
        return "Bagus";
      case 5:
        return "Sangat Bagus";
      default:
        return "-";
    }
  }

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
                "Tap Rating Penilaian",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const GitsSpacing.vertical16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GitsStarRating(
                    rating: rating,
                    isTap: true,
                    result: (value) {
                      rating = value;
                      setState(() {});
                    },
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: MediaQuery.of(context).size.width / 5.5,
                    unratedColor: Colors.amber.withAlpha(50),
                  ),
                  const GitsSpacing.vertical16(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Feedback : ${feedbackValue(rating.toInt())}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Rating : $rating",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const GitsSpacing.vertical24(),
              const Text(
                "Input Penilaian",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const GitsSpacing.vertical16(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: ratingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter rating',
                    labelText: 'Enter rating',
                    suffixIcon: MaterialButton(
                      onPressed: () {
                        inputRating =
                            double.parse(ratingController.text);
                        setState(() {});
                      },
                      child: const Text('Rate'),
                    ),
                  ),
                ),
              ),
              const GitsSpacing.vertical16(),
              GitsStarRating(
                rating: inputRating,
                isTap: false,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: MediaQuery.of(context).size.width / 5.5,
                unratedColor: Colors.amber.withAlpha(50),
              ),
            ],
          ),
        ));
  }
}
