import 'package:flutter/material.dart';

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
