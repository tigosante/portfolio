import 'package:flutter/foundation.dart' show immutable;
import 'package:portfolio/domain/domain.dart' show SkillEntity;

@immutable
class SkillModel extends SkillEntity {
  const SkillModel({
    required super.name,
    required super.color,
    required super.imageUrl,
    required super.startWork,
    bool? showLogo,
    bool? showTitle,
  }) : super(
          showLogo: showLogo ?? false,
          showTitle: showTitle ?? false,
        );

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! SkillModel) return false;
    if (identical(this, other)) return true;

    return other.name == name &&
        other.color == color &&
        other.imageUrl == imageUrl &&
        other.startWork == startWork &&
        other.showLogo == showLogo &&
        other.showTitle == showTitle;
  }

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String,
      color: json['color'] as String? ?? '',
      imageUrl: json['logo'] as String? ?? '',
      startWork: json['start_work'] as String? ?? '',
      showTitle: bool.tryParse(json['show_title']?.toString().trim() ?? '') ?? true,
      showLogo: bool.tryParse(json['show_logo']?.toString().trim() ?? '') ?? true,
    );
  }
}
