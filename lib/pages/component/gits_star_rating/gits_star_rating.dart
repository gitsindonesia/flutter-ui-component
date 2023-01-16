import 'package:flutter/material.dart';
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
