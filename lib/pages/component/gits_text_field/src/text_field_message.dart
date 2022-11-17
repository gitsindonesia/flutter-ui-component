import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';

class TextFieldMessage extends StatelessWidget {
  const TextFieldMessage.info({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.orange,
        super(key: key);

  const TextFieldMessage.success({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.green,
        super(key: key);

  const TextFieldMessage.error({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.red,
        super(key: key);

  const TextFieldMessage.warning({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : color = Colors.yellow,
        super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GitsSizes.s4),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
