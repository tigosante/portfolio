import 'package:flutter/foundation.dart' show immutable;

@immutable
class SkillEntity {
  const SkillEntity({
    required this.name,
    required this.color,
    required this.imageUrl,
    required this.startWork,
    this.showLogo = true,
    this.showTitle = true,
  });

  final String name;
  final String color;
  final String imageUrl;
  final String startWork;
  final bool showLogo;
  final bool showTitle;
}
