import 'package:flutter/material.dart';
import 'package:portfolio/domain/domain.dart';
import 'package:portfolio/features/home/ui/ui.dart';
import 'package:portfolio/ui/ui.dart';

class ProjectsWidgetTemplate extends StatefulWidget {
  const ProjectsWidgetTemplate({super.key});

  @override
  State<ProjectsWidgetTemplate> createState() => _ProjectsWidgetTemplateState();
}

class _ProjectsWidgetTemplateState extends State<ProjectsWidgetTemplate> {
  final List<ProjectEntity> _projectList = [
    ProjectEntity(
      name: '3DGym',
      imageUrl: '',
      date: '2021',
      color: '#000000',
      description: 'Plataforma de vídeos para fisioterapeutas e seus pacientes.',
      skills: [
        const SkillEntity(
          name: 'Swift',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Kotlin',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'TypeScript',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'NestJS',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'PrismaJS',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'TypeORM',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'PostgreSQL',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Algolia',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Firebase',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
    ProjectEntity(
      color: '#081c30',
      date: '2022',
      name: 'Capsula Cards',
      imageUrl: '',
      description: 'Plataforma para estudos com cartões de memorização.',
      skills: [
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
    ProjectEntity(
      color: '#081c30',
      date: '2022',
      name: 'Capsula Cards',
      imageUrl: '',
      description: 'Plataforma para estudos com cartões de memorização.',
      skills: [
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
    ProjectEntity(
      color: '#081c30',
      date: '2022',
      name: 'Capsula Cards',
      imageUrl: '',
      description: 'Plataforma para estudos com cartões de memorização.',
      skills: [
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
    ProjectEntity(
      color: '#081c30',
      date: '2022',
      name: 'Capsula Cards',
      imageUrl: '',
      description: 'Plataforma para estudos com cartões de memorização.',
      skills: [
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
    ProjectEntity(
      color: '#081c30',
      date: '2022',
      name: 'Capsula Cards',
      imageUrl: '',
      description: 'Plataforma para estudos com cartões de memorização.',
      skills: [
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
    ProjectEntity(
      color: '#081c30',
      date: '2022',
      name: 'Capsula Cards',
      imageUrl: '',
      description: 'Plataforma para estudos com cartões de memorização.',
      skills: [
        const SkillEntity(
          name: 'Flutter',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
        const SkillEntity(
          name: 'Dart',
          color: '',
          imageUrl: '',
          startWork: '2020',
          type: '',
          showLogo: false,
          showTitle: false,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final projects = (_projectList..sort((a, b) => b.date.compareTo(a.date)));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          toolbarHeight: kToolbarHeight + 30,
          title: TextWidgetAtom('Hello!', style: context.textTheme.headlineMedium),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(context.measuries.paddingMedium),
          child: Row(
            children: [
              for (var index = 0; index < projects.length; index++)
                Padding(
                  padding: EdgeInsets.only(right: index == (projects.length - 1) ? 0 : context.measuries.paddingMedium),
                  child: RectangleAspectRatioWidgetMolecule(
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
