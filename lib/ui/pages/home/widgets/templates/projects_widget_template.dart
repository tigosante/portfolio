import 'package:flutter/material.dart';
import 'package:portfolio/extensions/extensions.dart'
    show BuildContextExtension;

class ProjectsWidgetTemplate extends StatelessWidget {
  const ProjectsWidgetTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Projects',
        style: context.appTextTheme.headlineMedium
            .copyWith(color: context.appColors.primary),
      ),
    );
  }
}
