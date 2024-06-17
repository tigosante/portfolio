import 'package:flutter/foundation.dart' show immutable;
import 'package:portfolio/domain/models/models.dart';

@immutable
// ignore: must_be_immutable
class ProjectModel {
  ProjectModel({
    required List<SkillModel> skills,
    required this.name,
    required this.type,
    required this.endWork,
    required this.imageUrl,
    required this.startWork,
    required this.skillIdList,
    required this.description,
  }) : _skills = skills;

  final String name;
  final String type;
  final String endWork;
  final String imageUrl;
  final String startWork;
  final String description;
  final List<String> skillIdList;

  final List<SkillModel> _skills;
  String _skillSearchText = '';

  List<SkillModel> get skills => _skills;

  set skills(List<SkillModel> data) {
    _skillSearchText = data.toSet().map((skill) => skill.toString()).join(', ');
    _skills
      ..clear()
      ..addAll(skills);
  }

  String get searchtext => '$name $type $startWork $endWork $description $_skillSearchText';

  @override
  String toString() {
    return searchtext;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'end_work': endWork,
      'image_url': imageUrl,
      'start_work': startWork,
      'description': description,
      'skill_id_list': skillIdList,
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      skills: const [],
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      endWork: json['end_work'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      startWork: json['start_work'] as String? ?? '',
      description: json['description'] as String? ?? '',
      skillIdList: (json['skill_id_list'] as List<String>?)?.map((skill) => skill.trim()).toList() ?? [],
    );
  }
}
