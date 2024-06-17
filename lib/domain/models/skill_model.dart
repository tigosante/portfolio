class SkillModel {
  const SkillModel({
    required this.name,
    required this.type,
    required this.color,
    required this.startWork,
  });

  final String name;
  final String type;
  final String color;
  final String startWork;

  String get searchtext => '$name $type $startWork';

  @override
  String toString() {
    return searchtext;
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'type': type, 'color': color, 'startWork': startWork};
  }

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      color: json['color'] as String? ?? '',
      startWork: json['start_work'] as String? ?? '',
    );
  }
}
