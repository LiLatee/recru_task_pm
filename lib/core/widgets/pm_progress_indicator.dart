import 'dart:io';

import 'package:flutter/material.dart';

class PMProgressIndicator extends StatelessWidget {
  const PMProgressIndicator({
    super.key,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return Container(
        padding: padding,
        child: Text(
          'test loading',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    } else {
      return RepaintBoundary(
        child: Container(
          padding: padding,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
            strokeCap: StrokeCap.round,
          ),
        ),
      );
    }
  }
}
