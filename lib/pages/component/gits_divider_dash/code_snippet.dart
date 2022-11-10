const String codeSnippetGitsDividerDash =
    '''import 'package:flutter/material.dart';

class GitsDividerDash extends StatelessWidget {
  const GitsDividerDash({
    Key? key,
    this.width = double.infinity,
    this.thickness = 2,
    this.color,
    this.dashWidth = 4,
    this.dashGap = 12,
    this.strokeCap = StrokeCap.square,
  }) : super(key: key);

  final double width;
  final double thickness;
  final Color? color;
  final double dashWidth;
  final double dashGap;
  final StrokeCap strokeCap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: thickness,
      child: CustomPaint(
        painter: DrawDashHorizontal(
          thickness: thickness,
          dashGap: dashGap,
          dashWidth: dashWidth,
          color: color ?? Colors.grey,
          strokeCap: strokeCap,
        ),
      ),
    );
  }
}

class DrawDashHorizontal extends CustomPainter {
  DrawDashHorizontal({
    this.thickness = 2,
    this.color = Colors.grey,
    this.dashWidth = 10,
    this.dashGap = 15,
    this.strokeCap = StrokeCap.square,
  }) {
    _paint = Paint();
    _paint.color = color; //dots color
    _paint.strokeWidth = thickness; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  late Paint _paint;
  final double thickness;
  final Color color;
  final double dashWidth;
  final double dashGap;
  final StrokeCap strokeCap;

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < size.width; i = i + dashGap) {
      canvas.drawLine(Offset(i, 0.0), Offset(i + dashWidth, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}''';

const String codeSnippetExampleGitsDividerDash = '''Scaffold(
  appBar: AppBar(title: const Text('Example')),
  body: const Center(
    child: GitsDividerDash(),
  ),
)''';
