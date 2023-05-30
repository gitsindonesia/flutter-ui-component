import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_chips_input/code_snippet.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_chips_input/cubit/chips_input_cubit.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_chips_input/widgets/gits_chips_input.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_chips_input/widgets/gits_chips_item.dart';
import 'package:gits_flutter_ui_component/widgets/card_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/device_highlight.dart';
import 'package:gits_flutter_ui_component/widgets/scaffold_page.dart';
import 'package:gits_flutter_ui_component/widgets/short_description.dart';

class GitsChipsInputPage extends StatelessWidget {
  const GitsChipsInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(title: const Text('Gits Chips Input')),
      children: [
        CardHighlight(
          codeSnippet: codeSnippetGitsChipsInput,
          child: const ShortDescription(
            title: 'Gits Chips Input',
            description: 'Create component gits chips input',
          ),
        ),
        DeviceHighlight(
          codeSnippet: codeSnippetExampleGitsChipsInput,
          builder: (context) => const ExampleGitsChipsInputPage(),
        )
      ],
    );
  }
}

class ExampleGitsChipsInputPage extends StatefulWidget {
  const ExampleGitsChipsInputPage({super.key});

  @override
  State<ExampleGitsChipsInputPage> createState() => _ExampleGitsChipsInputPageState();
}

class _ExampleGitsChipsInputPageState extends State<ExampleGitsChipsInputPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChipsInputCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Example Gits Chips Input"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GitsChipsInput(
            initialData: const [],
            callback: (value) {
              /// here is the change data list
            },
            chipBuilder: (BuildContext context, data) {
              return GitsChipsItem(
                label: data,
                onDeleted: (label) {
                  context.read<ChipsInputCubit>().deleteChips(
                    value: label.toLowerCase().trim(),
                    callback: (value) {
                      /// here is the change data list
                      /// after user remove the chips
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
