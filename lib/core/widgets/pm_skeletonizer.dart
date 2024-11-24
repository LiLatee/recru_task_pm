import 'package:flutter/material.dart';
import 'package:recru_task_pm/core/tests_manager.dart';
import 'package:recru_task_pm/core/theme.dart';
import 'package:recru_task_pm/dependencies.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PmSkeletonizer extends StatelessWidget {
  const PmSkeletonizer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: primaryColor.withOpacity(0.05),
        highlightColor: primaryColor.withOpacity(0.1),
      ),
      enabled: !sl<TestsManager>().duringTestExecution,
      child: child,
    );
  }
}
