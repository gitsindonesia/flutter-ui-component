const String codeSnippetGitsSliverListSeparated = '''import 'dart:math' as math;

import 'package:flutter/material.dart';

class GitsSliverListSeparated extends StatelessWidget {
  const GitsSliverListSeparated({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.semanticIndexOffset = 0,
    this.findChildIndexCallback,
  }) : super(key: key);

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final int semanticIndexOffset;
  final ChildIndexGetter? findChildIndexCallback;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ?? EdgeInsets.zero,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final int itemIndex = index ~/ 2;
            if (index.isEven) {
              return itemBuilder(context, itemIndex);
            }
            return separatorBuilder(context, itemIndex ~/ 2);
          },
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          semanticIndexOffset: semanticIndexOffset,
          findChildIndexCallback: findChildIndexCallback,
          semanticIndexCallback: (Widget widget, int localIndex) {
            if (localIndex.isEven) {
              return localIndex ~/ 2;
            }
            return null;
          },
          childCount: math.max(0, itemCount * 2 - 1),
        ),
      ),
    );
  }
}''';

const String codeSnippetGitsSliverListSeparatedExample = '''Scaffold(
  body: CustomScrollView(
    slivers: [
      const SliverAppBar(title: Text('Example')),
      GitsSliverListSeparated(
        itemBuilder: (context, index) => ListTile(
          title: Text('Item \$index'),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
      ),
    ],
  ),
)''';
