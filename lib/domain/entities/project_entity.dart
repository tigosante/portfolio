import 'package:portfolio/domain/entities/entities.dart';

class ProjectEntity {
  final String name;
  final String date;
  final String color;
  final String imageUrl;
  final String description;
  final List<SkillEntity> skills;

  ProjectEntity({
    required this.name,
    required this.date,
    required this.color,
    required this.skills,
    required this.imageUrl,
    required this.description,
  });
}
