import 'package:flutter/material.dart';

class GitsChipsItem extends StatelessWidget {
  const GitsChipsItem({
    Key? key,
    required this.label,
    this.onDeleted,
  }) : super(key: key);

  final String label;
  final ValueChanged<String>? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      deleteIcon: const Icon(
        Icons.close,
        color: Colors.blue,
        size: 18,
      ),
      onDeleted: () => onDeleted?.call(label),
    );
  }
}
