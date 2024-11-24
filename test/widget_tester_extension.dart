import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  /// Makes a gesture for pull to refresh.
  ///
  /// Starts dragging gesture at the center of the phone. By default iPhone X sizes are provided.
  Future<void> pullToRefresh() async {
    final Offset middleOfPhone = getCenter(find.byType(MaterialApp));

    await TestAsyncUtils.guard(() async {
      await startGesture(middleOfPhone);
      await dragFrom(middleOfPhone, const Offset(0, 75));
    });
  }

  Future<void> scrollToBottom() async {
    final Offset middleOfPhone = getCenter(find.byType(MaterialApp));

    await TestAsyncUtils.guard(() async {
      await startGesture(middleOfPhone);
      await dragFrom(middleOfPhone, const Offset(0, -10000));
    });
  }
}
