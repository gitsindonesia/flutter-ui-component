String codeSnippetGitsStatusMessage =
    ''' import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/extensions/text_theme_extension.dart';

import '../../../widgets/gits_spacing.dart';

class GitsStatusMessage extends StatelessWidget {
  const GitsStatusMessage(
      {super.key,
      this.text,
      required this.backgroundColor,
      required this.iconColor,
      this.textColor,
      required this.iconData,
      this.child,
      this.center = false,
      this.fontWeight = FontWeight.w400,
      this.onTap});

  const GitsStatusMessage.info({
    Key? key,
    required BuildContext context,
    this.text,
    this.textColor,
    this.child,
    this.onTap,
  })  : assert(text != null || child != null),
        backgroundColor = const Color(0xFFFFFDE1),
        iconColor = const Color(0xFFF99C1D),
        iconData = Icons.info,
        center = false,
        fontWeight = FontWeight.w400,
        super(key: key);

  const GitsStatusMessage.infoBlue({
    Key? key,
    required BuildContext context,
    this.text,
    this.textColor,
    this.child,
    this.onTap,
  })  : assert(text != null || child != null),
        backgroundColor = const Color(0xFFEDF7FF),
        iconColor = const Color(0xFF1A73B5),
        iconData = Icons.info,
        center = false,
        fontWeight = FontWeight.w400,
        super(key: key);

  final String? text;
  final Color backgroundColor;
  final Color iconColor;
  final Color? textColor;
  final IconData iconData;
  final Widget? child;
  final bool center;
  final FontWeight fontWeight;
  final GestureTapCallback? onTap;

  Widget getChild(BuildContext context) =>
      child ??
      Text(
        text ?? '',
        maxLines: 2,
        style: context.bodySmall
            ?.copyWith(color: textColor, fontWeight: fontWeight),
      );

  Widget getWidget(BuildContext context) =>
      center ? getChild(context) : Expanded(child: getChild(context));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: GitsSizes.s16,
          vertical: GitsSizes.s8,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(GitsSizes.s8),
        ),
        child: Row(
          mainAxisAlignment:
              center ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(iconData, size: GitsSizes.s16, color: iconColor),
            const GitsSpacing.horizontal8(),
            getWidget(context)
          ],
        ),
      ),
    );
  }
}
''';
String codeSnippetExampleGitsStatusMessage = ''' Scaffold(
      appBar: AppBar(title: const Text('Example Gits Status Message')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const GitsStatusMessage(
                backgroundColor: Colors.black,
                iconColor: Colors.white,
                iconData: Icons.info,
                textColor: Colors.white,
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            const GitsSpacing.vertical16(),
            GitsStatusMessage.info(
                context: context,
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            const GitsSpacing.vertical16(),
            GitsStatusMessage.infoBlue(
              context: context,
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            const GitsSpacing.vertical16(),
            GitsStatusMessage.infoBlue(
              context: context,
              child: Column(
                children: const [
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                  GitsSpacing.vertical4(),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                ],
              ),
            ),
          ],
        ),
      ),
    );''';
