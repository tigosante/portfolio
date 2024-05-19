import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/presenter/presenter.dart' show SkeletonLoadingWidget, TextWidget;

class ApresentationLoadingWidget extends StatelessWidget {
  const ApresentationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoadingWidget(
      child: Wrap(
        children: List.generate(
          19,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: context.dimensions.paddingSmall)
                .copyWith(bottom: context.dimensions.paddingMedium),
            child: TextWidget('------', style: context.textTheme.titleMedium),
          ),
        ),
      ),
    );
  }
}
