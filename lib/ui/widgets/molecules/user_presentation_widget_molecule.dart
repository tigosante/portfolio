import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension, TextWidgetAtom;

class UserPresentationWidgetMolecule extends StatelessWidget {
  const UserPresentationWidgetMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidgetAtom(
          'Oi, sou ${context.env.userName.split(" ").first}!'.translate(),
          maxLines: 5,
          style: context.textTheme.displayMedium.copyWith(color: context.colorScheme.primary),
        ),
        TextWidgetAtom(
          'Atuo como dev full-stack especiliazado em mobile.'.translate(),
          maxLines: 5,
          style: context.textTheme.headlineSmall.copyWith(color: context.colorScheme.secondary),
        ),
      ],
    );
  }
}
