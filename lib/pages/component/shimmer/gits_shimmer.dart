import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:shimmer/shimmer.dart';

class GitsShimmer extends StatelessWidget {
  final ShimmerDirection? direction;
  final Widget child;

  const GitsShimmer({
    Key? key,
    this.direction,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: direction ?? ShimmerDirection.ltr,
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFFFFFFF),
      child: child,
    );
  }
}

class GitsItemShimmer extends StatelessWidget {
  const GitsItemShimmer({
    Key? key,
    required this.width,
    required this.height,
    this.margin,
    this.radius,
    this.boxShape = BoxShape.rectangle,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final BoxShape boxShape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        shape: boxShape,
        color: const Color(0xFFFFFFFF),
        borderRadius: boxShape == BoxShape.rectangle
            ? BorderRadius.circular(radius ?? GitsSizes.s8)
            : null,
      ),
    );
  }
}
