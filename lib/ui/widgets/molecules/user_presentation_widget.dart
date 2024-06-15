import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension;
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
          'Oi, sou ${context.env.userName.split(" ").first}!',
          maxLines: 5,
          style: context.textTheme.displayMedium.copyWith(color: context.colorScheme.primary),
        ),
        TextWidget(
          'Atuo como dev full-stack especiliazado em mobile.',
          maxLines: 5,
          style: context.textTheme.headlineSmall.copyWith(color: context.colorScheme.secondary),
        ),
      ],
    );
  }
}
