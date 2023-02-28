const String codeSnippetGitsStarRating =
    '''import 'package:flutter/material.dart';

class GitsStarRating extends StatefulWidget {
  const GitsStarRating({
    Key? key,
    required this.itemBuilder,
    this.unratedColor,
    this.itemCount = 5,
    this.itemPadding = EdgeInsets.zero,
    this.itemSize = 40.0,
    this.physics = const NeverScrollableScrollPhysics(),
    this.rating = 0.0,
    this.isTap = false,
    this.result,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final Color? unratedColor;
  final int itemCount;
  final EdgeInsets itemPadding;
  final double itemSize;
  final ScrollPhysics physics;
  final double rating;
  final bool isTap;
  final Function(double)? result;

  @override
  State<GitsStarRating> createState() => _GitsStarRatingState();
}

class _GitsStarRatingState extends State<GitsStarRating> {
  double _ratingFraction = 0.0;
  int _ratingNumber = 0;

  @override
  void initState() {
    super.initState();
    _ratingNumber = widget.rating.truncate() + 1;
    _ratingFraction = widget.rating - _ratingNumber + 1;
  }

  @override
  Widget build(BuildContext context) {
    _ratingNumber = widget.rating.truncate() + 1;
    _ratingFraction = widget.rating - _ratingNumber + 1;
    return SingleChildScrollView(
      physics: widget.physics,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _children,
      ),
    );
  }

  List<Widget> get _children {
    return List.generate(
      widget.itemCount,
      (index) => _buildItems(index),
    );
  }

  Widget _buildItems(int index) {
    return Padding(
      padding: widget.itemPadding,
      child: GestureDetector(
        onTap: widget.isTap
            ? () {
                setState(() {
                  _ratingNumber = index + 1;
                  _ratingFraction = (index + 1) - _ratingNumber + 1;
                  widget.result!(_ratingNumber.toDouble());
                });
              }
            : null,
        child: SizedBox(
          width: widget.itemSize,
          height: widget.itemSize,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: index + 1 < _ratingNumber
                    ? widget.itemBuilder(context, index)
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          widget.unratedColor ??
                              Theme.of(context).disabledColor,
                          BlendMode.srcIn,
                        ),
                        child: widget.itemBuilder(context, index),
                      ),
              ),
              if (index + 1 == _ratingNumber)
                FittedBox(
                  fit: BoxFit.contain,
                  child: ClipRect(
                    clipper: _IndicatorClipper(
                      ratingFraction: _ratingFraction,
                    ),
                    child: widget.itemBuilder(context, index),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

//For handle value double rating
class _IndicatorClipper extends CustomClipper<Rect> {
  _IndicatorClipper({
    required this.ratingFraction,
  });

  final double ratingFraction;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0.0,
      0.0,
      size.width * ratingFraction,
      size.height,
    );
  }

  @override
  bool shouldReclip(_IndicatorClipper oldClipper) {
    return ratingFraction != oldClipper.ratingFraction;
  }
}
''';

String codeSnippetExampleGitsStarRating = '''class ExampleGitsStarRating extends StatefulWidget {
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
                        "Feedback : feedbackValue(rating.toInt())",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Rating : rating",
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
''';
