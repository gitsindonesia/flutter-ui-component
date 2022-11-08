import 'package:collection/collection.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:gits_flutter_ui_component/cubit/global_cubit.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/widgets/card_properties.dart';

class DeviceHighlight extends StatefulWidget {
  const DeviceHighlight({
    Key? key,
    required this.builder,
    required this.codeSnippet,
    this.properties,
  }) : super(key: key);

  final Widget Function(BuildContext context) builder;
  final String codeSnippet;
  final List<Widget>? properties;

  @override
  State<DeviceHighlight> createState() => _DeviceHighlightState();
}

class _DeviceHighlightState extends State<DeviceHighlight>
    with AutomaticKeepAliveClientMixin<DeviceHighlight> {
  bool isOpen = false;
  bool isOpenProperties = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final themeMode =
        context.select((GlobalCubit bloc) => bloc.state.themeMode);
    final themeModeSimulation =
        context.select((GlobalCubit bloc) => bloc.state.themeModeSimulation);
    final orientationSimulation =
        context.select((GlobalCubit bloc) => bloc.state.orientationSimulation);
    final isFrameVisibleSimulation = context
        .select((GlobalCubit bloc) => bloc.state.isFrameVisibleSimulation);
    final deviceInfoSimulation =
        context.select((GlobalCubit bloc) => bloc.state.deviceInfoSimulation);

    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DeviceFrame(
                  orientation: orientationSimulation,
                  isFrameVisible: isFrameVisibleSimulation,
                  device: deviceInfoSimulation,
                  screen: MaterialApp(
                    useInheritedMediaQuery: true,
                    theme: ThemeData.light(),
                    darkTheme: ThemeData.dark(),
                    themeMode: themeModeSimulation,
                    home: Builder(
                      builder: (context) => widget.builder(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const VerticalDivider(thickness: 1, width: 1),
              const SizedBox(width: 16),
              if (!isOpenProperties)
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isOpenProperties = true;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        'Properties',
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              else
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isOpenProperties = false;
                                });
                              },
                              icon: const Icon(Icons.keyboard_arrow_right),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Properties',
                              style: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        CardProperties(
                          title: 'Theme Mode',
                          selected: themeModeSimulation.name,
                          items: [
                            ThemeMode.light.name,
                            ThemeMode.dark.name,
                          ],
                          onChanged: (value) {
                            context.read<GlobalCubit>().setThemeModeSimulation(
                                  ThemeMode.values.firstWhereOrNull(
                                        (element) => element.name == value,
                                      ) ??
                                      ThemeMode.light,
                                );
                          },
                        ),
                        const SizedBox(height: 8),
                        CardProperties(
                          title: 'Orientation',
                          selected: orientationSimulation.name,
                          items: [
                            Orientation.portrait.name,
                            Orientation.landscape.name,
                          ],
                          onChanged: (value) {
                            context
                                .read<GlobalCubit>()
                                .setOrientationSimulation(
                                  Orientation.values.firstWhereOrNull(
                                        (element) => element.name == value,
                                      ) ??
                                      Orientation.portrait,
                                );
                          },
                        ),
                        const SizedBox(height: 8),
                        CardProperties(
                          title: 'Frames',
                          selected: isFrameVisibleSimulation
                              ? 'Device Frame'
                              : 'None',
                          items: const [
                            'Device Frame',
                            'None',
                          ],
                          onChanged: (value) {
                            context
                                .read<GlobalCubit>()
                                .setFrameVisibleSimulation(
                                  value == 'Device Frame',
                                );
                          },
                        ),
                        const SizedBox(height: 8),
                        CardProperties(
                          title: 'Devices',
                          selected: deviceInfoSimulation.name,
                          items: [
                            ...Devices.ios.all.map((e) => e.name),
                          ],
                          onChanged: (value) {
                            final ios = Devices.ios.all.firstWhereOrNull(
                                (element) => element.name == value);

                            context.read<GlobalCubit>().setDeviceInfoSimulation(
                                  ios ?? Devices.ios.iPhone13,
                                );
                          },
                        ),
                        if (widget.properties?.isNotEmpty ?? false) ...[
                          const SizedBox(height: 8),
                          ...widget.properties!,
                        ],
                      ],
                    ),
                  ),
                ),
            ],
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
