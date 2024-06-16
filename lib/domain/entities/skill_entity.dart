import 'package:flutter/foundation.dart' show immutable;

@immutable
class SkillEntity {
  const SkillEntity({
    required this.name,
    required this.type,
    required this.color,
    required this.imageUrl,
    required this.startWork,
  });

  final String name;
  final String type;
  final String color;
  final String imageUrl;
  final String startWork;

  String get searchtext => '$name $type $startWork';
}
