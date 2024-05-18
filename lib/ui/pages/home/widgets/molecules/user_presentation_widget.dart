import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension;
import 'package:portfolio/ui/ui.dart' show TextWidget;

class UserPresentationWidget extends StatelessWidget {
  const UserPresentationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Oi, sou Tiago!',
          style: context.textTheme.displayMedium.copyWith(color: context.colors.primary),
        ),
        TextWidget(
          'Atuo como dev full-stack especiliazado em mobile.',
          style: context.textTheme.headlineSmall.copyWith(color: context.colors.secondary),
        ),
      ],
    );
  }
}
