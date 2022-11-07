import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gits_flutter_ui_component/cubit/global_cubit.dart';

class CardHighlight extends StatefulWidget {
  const CardHighlight({
    Key? key,
    required this.child,
    required this.codeSnippet,
  }) : super(key: key);

  final Widget child;
  final String codeSnippet;

  @override
  State<CardHighlight> createState() => _CardHighlightState();
}

class _CardHighlightState extends State<CardHighlight>
    with AutomaticKeepAliveClientMixin<CardHighlight> {
  bool isOpen = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final themeMode =
        context.select((GlobalCubit bloc) => bloc.state.themeMode);

    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: widget.child,
              ),
            ),
          ),
        ),
        ExpansionTile(
          title: const Text('Source Code'),
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: const EdgeInsets.all(16),
          onExpansionChanged: (value) => setState(() => isOpen = value),
          leading: Container(
            constraints: const BoxConstraints(maxWidth: 100),
            child: TextButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Copy'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.codeSnippet));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to Clipboard')),
                );
              },
            ),
          ),
          children: [
            SyntaxView(
              code: widget.codeSnippet,
              syntaxTheme: themeMode == ThemeMode.dark
                  ? SyntaxTheme.vscodeDark()
                  : SyntaxTheme.vscodeLight(),
            ),
          ],
        ),
      ],
    );
  }
}
