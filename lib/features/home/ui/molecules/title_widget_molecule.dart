import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension, TextWidgetAtom;

class TitleWidgetMolecule extends StatelessWidget {
  const TitleWidgetMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidgetAtom(
          'Projetos.',
          style: context.textTheme.titleLarge,
        ),
        SizedBox(width: context.measuries.paddingSmall / 2),
        TextWidgetAtom(
          'Vejo os detalhes.',
          style: context.textTheme.titleLarge.copyWith(color: context.colorScheme.secondary),
        ),
      ],
    );
  }
}
