import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:gits_flutter_ui_component/pages/component/gits_container_shadow/gits_container_shadow.dart';

class GitsSearch extends StatefulWidget {
  final String hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ValueChanged<String>? onChanged;

  const GitsSearch({
    super.key,
    required this.hintText,
    this.onChanged,
    this.padding,
    this.margin,
  });

  @override
  State<GitsSearch> createState() => _GitsSearchState();
}

class _GitsSearchState<T> extends State<GitsSearch> {
  @override
  Widget build(BuildContext context) {
    return GitsContainerShadow(
      margin: widget.margin,
      padding: widget.padding,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          hintText: widget.hintText,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
