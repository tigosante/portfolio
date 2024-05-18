import 'package:flutter/foundation.dart' show immutable;
import 'package:portfolio/data/models/models.dart' show SkillModel;
import 'package:portfolio/domain/domain.dart' show SkillTypeEntity;

@immutable
// ignore: must_be_immutable
class SkillTypeModel extends SkillTypeEntity {
  SkillTypeModel({
    required super.title,
    required super.skills,
  });

  @override
  int get hashCode => title.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! SkillTypeModel) return false;
    if (identical(this, other)) return true;
    return other.title == title && other.skills == skills;
  }

  factory SkillTypeModel.fromJson(Map<String, dynamic> json) {
    return SkillTypeModel(
      title: json['title'] as String? ?? '',
      skills: (json['skills'] as List).map((e) => SkillModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
