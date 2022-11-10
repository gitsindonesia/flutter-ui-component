import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';

class CardProperties extends StatelessWidget {
  const CardProperties({
    Key? key,
    required this.title,
    required this.selected,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final String selected;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    const selectedBackgroundColor = Colors.blue;
    const selectedTextColor = Colors.white;
    const unselectedBackgroundColor = Colors.grey;
    const unselectedTextColor = Colors.white;

    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const GitsSpacing.vertical8(),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: items
                    .map((e) => GestureDetector(
                          onTap: () => onChanged(e),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selected == e
                                  ? selectedBackgroundColor
                                  : unselectedBackgroundColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              e,
                              style: TextStyle(
                                color: selected == e
                                    ? selectedTextColor
                                    : unselectedTextColor,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
