import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension;
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonLoadingWidgetAtom extends StatelessWidget {
  const SkeletonLoadingWidgetAtom({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.all(Radius.circular(context.measuries.paddingSmall))),
      effect: PulseEffect(
        duration: const Duration(milliseconds: 500),
        to: context.colorScheme.secondary.withOpacity(0.1),
        from: context.colorScheme.primary.withOpacity(0.15),
      ),
      containersColor: context.colorScheme.primaryContainer,
      child: child,
    );
  }
}
