import '../../domain/entities/condition_entity.dart';

class ConditionModel {
  String text, icon;

  ConditionModel({
    required this.text,
    required this.icon,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json["text"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
      };
  ConditionEntity toEntity() => ConditionEntity(
        text: text,
        icon: icon,
      );
}
