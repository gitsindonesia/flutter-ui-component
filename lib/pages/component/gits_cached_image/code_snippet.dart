String codeSnippetGitsCachedImage =
    ''' import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_images.dart';
import 'package:gits_flutter_ui_component/pages/component/shimmer/gits_shimmer.dart';

enum TypeCachedImage { circle, rounded }

abstract class GitsCachedImage extends StatelessWidget {
  const GitsCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.contain,
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      placeholder: placeholder ??
          (context, url) => GitsShimmer(
                child: GitsItemShimmer(width: width, height: height),
              ),
      errorWidget: errorWidget ??
          (context, url, error) => Image.asset(
                GitsImages.placeholder,
                width: width,
                height: height,
                fit: fit,
              ),
    );
  }
}

class GitsCachedImageCircle extends GitsCachedImage {
  const GitsCachedImageCircle({
    super.key,
    required super.imageUrl,
    super.width,
    super.height,
    super.fit,
    super.placeholder,
    super.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(child: super.build(context));
  }
}

class GitsCachedImageRounded extends GitsCachedImage {
  const GitsCachedImageRounded({
    super.key,
    required super.imageUrl,
    super.width,
    super.height,
    super.fit,
    super.placeholder,
    super.errorWidget,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
      child: super.build(context),
    );
  }
}
''';

String codeSnippetExampleGitsCachedImagePage = ''' Scaffold(
      appBar: AppBar(title: const Text('Example Gits Cached Image')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GitsCachedImageCircle(
                imageUrl: urlImage,
                width: GitsSizes.s80,
                height: GitsSizes.s80,
                fit: BoxFit.cover,
              ),
              const GitsSpacing.vertical16(),
              GitsCachedImageRounded(
                imageUrl: urlImage,
                width: GitsSizes.s80,
                height: GitsSizes.s80,
                fit: BoxFit.cover,
              ),
              const GitsSpacing.vertical16(),
            ],
          ),
        ),
      ),
    );''';
