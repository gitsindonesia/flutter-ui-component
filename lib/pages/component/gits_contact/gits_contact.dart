// import 'package:flutter/material.dart';
// import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';

// class GitsContact extends StatelessWidget {
//   final String name;
//   final double multiplySize;
//   final bool isRemove;
//   final GestureTapCallback? onTapRemove;

//   const GitsContact(
//       {super.key,
//       required this.name,
//       this.multiplySize = 1,
//       this.isRemove = false,
//       this.onTapRemove});

//   String getLabel() {
//     List<String> words = name.split(' ');
//     String label = "";

//     if (words.length > 1) {
//       for (var i = 0; i < 2; i++) {
//         if (words[i].isNotNullOrEmpty) {
//           label = label + words[i][0];
//         }
//       }
//     } else {
//       label = words[0][0];
//     }
//     return label;
//   }

//   Widget getLabelName() => isRemove
//       ? Container(
//           margin: const EdgeInsets.only(top: GitsSizes.s8),
//           width: GitsSizes.s48,
//           child: Text(
//             name,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: GitsSizes.s10,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         )
//       : Container();

//   Widget getButtonClose(BuildContext context) => isRemove
//       ? Positioned(
//           top: 0,
//           right: 0,
//           child: InkWell(
//             onTap: onTapRemove,
//             child: Container(
//               padding: const EdgeInsets.all(GitsSizes.s2),
//               decoration:const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.blue,
//               ),
//               child: const Icon(
//                 Icons.close,
//                 size: GitsSizes.s14,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         )
//       : Container();
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GitsCachedImageCircle(
//                   imageUrl: name.toInitialAvatarUrl(),
//                   width: GitsSizes.s42 * multiplySize,
//                   height: GitsSizes.s42 * multiplySize,
//                   fit: BoxFit.cover,
//                 ),
//               ],
//             ),
//             getLabelName()
//           ],
//         ),
//         getButtonClose(context),
//       ],
//     );
//   }
// }
