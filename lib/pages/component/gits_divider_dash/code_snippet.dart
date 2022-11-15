const String codeSnippetGitsDividerDash =
    '''import 'package:flutter/material.dart';

class GitsDividerDash extends StatelessWidget {
  const GitsDividerDash({
    Key? key,
    this.size = double.infinity,
    this.thickness = 2,
    this.color,
    this.dashWidth = 4,
    this.dashGap = 12,
    this.strokeCap = StrokeCap.square,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  final double size;
  final double thickness;
  final Color? color;
  final double dashWidth;
  final double dashGap;
  final StrokeCap strokeCap;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.vertical) {
      return SizedBox(
        width: thickness,
        height: size,
        child: CustomPaint(
          painter: _DrawDashVertical(
            thickness: thickness,
            dashGap: dashGap,
            dashWidth: dashWidth,
            color: color ?? Colors.grey,
            strokeCap: strokeCap,
          ),
        ),
      );
    }
    return SizedBox(
      width: size,
      height: thickness,
      child: CustomPaint(
        painter: _DrawDashHorizontal(
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

class _DrawDashHorizontal extends CustomPainter {
  _DrawDashHorizontal({
    this.thickness = 2,
    this.color = Colors.grey,
    this.dashWidth = 10,
    this.dashGap = 15,
    this.strokeCap = StrokeCap.square,
  }) {
    _paint = Paint();
    _paint.color = color; //dots color
    _paint.strokeWidth = thickness; //dots thickness
    _paint.strokeCap = strokeCap; //dots corner edges
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
}

class _DrawDashVertical extends CustomPainter {
  _DrawDashVertical({
    this.thickness = 2,
    this.color = Colors.grey,
    this.dashWidth = 10,
    this.dashGap = 15,
    this.strokeCap = StrokeCap.square,
  }) {
    _paint = Paint();
    _paint.color = color; //dots color
    _paint.strokeWidth = thickness; //dots thickness
    _paint.strokeCap = strokeCap; //dots corner edges
  }

  late Paint _paint;
  final double thickness;
  final Color color;
  final double dashWidth;
  final double dashGap;
  final StrokeCap strokeCap;

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < size.height; i = i + dashGap) {
      canvas.drawLine(Offset(0.0, i), Offset(0.0, i + dashWidth), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}''';

const String codeSnippetExampleGitsDividerDashHorizontal = '''Scaffold(
  appBar: AppBar(title: const Text('Example Horizontal')),
  body: const Center(
    child: Column(
      children: [
        // default
        GitsDividerDash(), 

        GitsSpacing.vertical16(),

        // custom
        GitsDividerDash( 
          thickness: 4,
          dashWidth: 8,
          dashGap: 24,
          strokeCap: StrokeCap.round,
        ),
      ],
  ),
)''';

const String codeSnippetExampleGitsDividerDashVertical = '''Scaffold(
  appBar: AppBar(title: const Text('Example Vertical')),
  body: const Center(
    child: Row(
      children: [
        // default
        GitsDividerDash(
          axis: Axis.vertical,
        ), 
        
        GitsSpacing.horizontal16(),

        // custom
        GitsDividerDash( 
          axis: Axis.vertical,
          thickness: 4,
          dashWidth: 8,
          dashGap: 24,
          strokeCap: StrokeCap.round,
        ),
      ],
  ),
)''';
