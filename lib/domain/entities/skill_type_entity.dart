import 'package:portfolio/domain/entities/entities.dart' show SkillEntity;

class SkillTypeEntity {
  SkillTypeEntity({
    required this.title,
    required this.skills,
  });

  String title;
  List<SkillEntity> skills;
}
