const String codeSnippetGitsCircularLoading =
    ''' import 'package:flutter/material.dart';

class GitsCircularLoading extends StatelessWidget {
  const GitsCircularLoading({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2.0),
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 3,
      ),
    );
  }
}
 ''';

String codeSnippetExampleGitsCircularLoading = ''' Scaffold(
      appBar: AppBar(title: const Text('Example Gits Circular Loading')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GitsCircularLoading(size: 24, color: Colors.red),
            ],
          ),
        ),
      ),
    ); ''';
