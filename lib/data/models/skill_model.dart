import 'package:flutter/foundation.dart' show immutable;
import 'package:portfolio/domain/domain.dart' show SkillEntity;

@immutable
class SkillModel extends SkillEntity {
  const SkillModel({
    required super.type,
    required super.name,
    required super.color,
    required super.imageUrl,
    required super.startWork,
  }) : super();

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! SkillModel) return false;
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        other.color == color &&
        other.imageUrl == imageUrl &&
        other.startWork == startWork;
  }

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      color: json['color'] as String? ?? '',
      imageUrl: json['logo'] as String? ?? '',
      startWork: json['start_work'] as String? ?? '',
    );
  }
}
