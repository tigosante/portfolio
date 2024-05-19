import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonLoadingWidget extends StatelessWidget {
  const SkeletonLoadingWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.all(Radius.circular(context.dimensions.paddingSmall))),
      effect: PulseEffect(
        duration: const Duration(milliseconds: 500),
        to: context.colors.secondary.withOpacity(0.1),
        from: context.colors.primary.withOpacity(0.15),
      ),
      containersColor: context.colors.black,
      child: child,
    );
  }
}
