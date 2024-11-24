import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PMNetworkImage extends StatelessWidget {
  const PMNetworkImage({
    required this.url,
    required this.imageBuilder,
    this.testPlaceholderHeight = 400,
    this.testPlaceholderWidth = 400,
    this.placeholder,
    super.key,
  });

  final String url;
  final Widget Function(BuildContext context, ImageProvider imageProvider) imageBuilder;
  final Widget Function(BuildContext context, String url)? placeholder;
  final double testPlaceholderHeight;
  final double testPlaceholderWidth;

  @override
  Widget build(BuildContext context) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return Placeholder(
        fallbackHeight: testPlaceholderHeight,
        fallbackWidth: testPlaceholderWidth,
      );
    }

    const Widget errorWidget = Center(child: Icon(Icons.error));

    if (url.isEmpty) {
      return errorWidget;
    }

    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: imageBuilder,
      fit: BoxFit.fitHeight,
      placeholder: placeholder ??
          (context, url) => const Skeleton.replace(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
      errorWidget: (context, url, error) => errorWidget,
    );
  }
}
