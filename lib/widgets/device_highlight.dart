import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gits_flutter_ui_component/cubit/global_cubit.dart';

class DeviceHighlight extends StatefulWidget {
  const DeviceHighlight({
    Key? key,
    required this.builder,
    required this.codeSnippet,
  }) : super(key: key);

  final Widget Function(BuildContext context) builder;
  final String codeSnippet;

  @override
  State<DeviceHighlight> createState() => _DeviceHighlightState();
}

class _DeviceHighlightState extends State<DeviceHighlight>
    with AutomaticKeepAliveClientMixin<DeviceHighlight> {
  bool isOpen = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final themeMode =
        context.select((GlobalCubit bloc) => bloc.state.themeMode);

    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: DeviceFrame(
            device: Devices.ios.iPhone13,
            screen: MaterialApp(
              useInheritedMediaQuery: true,
              home: Builder(
                builder: (context) => widget.builder(context),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
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
