String codeSnippetGitsContainerShadow =
    ''' import 'package:flutter/material.dart';

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
''';
String codeSnippetExampleGitsContainerShadowPage = ''' Scaffold(
      appBar: AppBar(title: const Text('Example Gits Container Shadow')),
      body: Column(
        children: [
          GitsContainerShadow(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Headline'),
                const GitsSpacing.horizontal16(),
                const Expanded(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const GitsSpacing.horizontal16(),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );''';
