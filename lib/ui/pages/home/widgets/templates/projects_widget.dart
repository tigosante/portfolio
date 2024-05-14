import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart' show BuildContextExtension;
import 'package:portfolio/ui/pages/home/widgets/widgets.dart';
import 'package:portfolio/ui/widgets/widgets.dart' show AnimatedIconsWidget;

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.surfaceInverse,
      child: SectionWidget(
        child: Column(
          children: [
            Text(
              'Projects',
              style: context.appTextTheme.headlineMedium.copyWith(color: context.appColors.primaryInverse),
            ),
            const AnimatedIconsWidget(),
          ],
        ),
      ),
    );
  }
}
