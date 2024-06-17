import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/features/home/ui/ui.dart';
import 'package:portfolio/ui/ui.dart';

class ProjectsWidgetTemplate extends StatefulWidget {
  const ProjectsWidgetTemplate({super.key});

  @override
  State<ProjectsWidgetTemplate> createState() => _ProjectsWidgetTemplateState();
}

class _ProjectsWidgetTemplateState extends State<ProjectsWidgetTemplate> {
  @override
  Widget build(BuildContext context) {
    final measuries = context.measuries;
    final paddingMedium = measuries.paddingMedium;
    final horizontalScreenPadding = measuries.horizontalScreenPadding;
    final projects = (_projectList..sort((a, b) => b.date.compareTo(a.date)));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalScreenPadding + measuries.paddingExtraLarge)
              .copyWith(top: paddingMedium),
          child: TextWidgetAtom('Projects'.translate(), style: context.textTheme.headlineMedium),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(paddingMedium).add(EdgeInsets.symmetric(horizontal: horizontalScreenPadding)),
          child: Row(
            children: [
              for (var index = 0; index < projects.length; index++)
                Padding(
                  padding: EdgeInsets.only(right: index == (projects.length - 1) ? 0 : paddingMedium),
                  child: RectangleAspectRatioWidgetOrganism(
                    project: projects[index],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
