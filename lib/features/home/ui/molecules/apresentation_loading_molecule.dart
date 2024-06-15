import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart';

class ApresentationLoadingMolecule extends StatelessWidget {
  const ApresentationLoadingMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoadingWidgetAtom(
      child: Wrap(
        children: List.generate(
          19,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: context.measuries.paddingSmall)
                .copyWith(bottom: context.measuries.paddingMedium),
            child: TextWidgetAtom('------', style: context.textTheme.titleMedium),
          ),
        ),
      ),
    );
  }
}
