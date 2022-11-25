import 'package:flutter/material.dart';

class GitsContainerShadow extends StatelessWidget {
  const GitsContainerShadow(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.borderRadius,
      this.padding,
      this.margin});

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
