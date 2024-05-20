import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/presenter/presenter.dart' show TextWidget;

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          'Projetos.',
          style: context.textTheme.titleLarge,
        ),
        SizedBox(width: context.dimensions.paddingSmall / 2),
        TextWidget(
          'Vejo os detalhes.',
          style: context.textTheme.titleLarge.copyWith(color: context.colors.secondary),
        ),
      ],
    );
  }
}
