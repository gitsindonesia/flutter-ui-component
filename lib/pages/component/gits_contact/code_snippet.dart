String codeSnippetGitsContact = ''' import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_cached_image/gits_cached_image.dart';

class GitsContact extends StatelessWidget {
  final String name;
  final double multiplySize;
  final bool isRemove;
  final GestureTapCallback? onTapRemove;

  const GitsContact(
      {super.key,
      required this.name,
      this.multiplySize = 1,
      this.isRemove = false,
      this.onTapRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GitsCachedImageCircle(
              imageUrl:
                  'https://ui-avatars.com/api/?background=F2F2F2&color=EB2139&name=\$name&bold=true',
              width: GitsSizes.s42 * multiplySize,
              height: GitsSizes.s42 * multiplySize,
              fit: BoxFit.cover,
            ),
            if (isRemove)
              Container(
                margin: const EdgeInsets.only(top: GitsSizes.s8),
                width: GitsSizes.s48,
                alignment: Alignment.center,
                child: Text(
                  name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: GitsSizes.s10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
          ],
        ),
        if (isRemove)
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: onTapRemove,
              child: Container(
                padding: const EdgeInsets.all(GitsSizes.s2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.close,
                  size: GitsSizes.s14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
''';

String codeSnippetExampleGitsContactPage = ''' Scaffold(
      appBar: AppBar(title: const Text('Example Gits Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GitsContact(
              name: 'Yusup Maulanadireja',
              isRemove: false,
              multiplySize: 1,
            ),
          ],
        ),
      ),
    );''';
