import "../../domain/entities/forecastday_entity.dart";
import "condition_model.dart";

class ForcastdayModel {
  num minTempInC;
  num maxTempInC;
  num minTempInF;
  num maxTempInF;
  num maxWindInMph;
  num maxWindInKph;
  num avghumidity;
  ConditionModel condition;
  String date;

  ForcastdayModel({
    required this.minTempInC,
    required this.maxTempInC,
    required this.minTempInF,
    required this.maxTempInF,
    required this.maxWindInMph,
    required this.maxWindInKph,
    required this.avghumidity,
    required this.condition,
    required this.date,
  });

  factory ForcastdayModel.fromJson(Map<String, dynamic> json) {
    return ForcastdayModel(
      minTempInC: json["day"]["mintemp_c"] ?? 0.0,
      maxTempInC: json["day"]["maxtemp_c"] ?? 0.0,
      minTempInF: json["day"]["mintemp_f"] ?? 0.0,
      maxTempInF: json["day"]["maxtemp_f"] ?? 0.0,
      maxWindInMph: json["day"]["maxwind_mph"] ?? 0.0,
      maxWindInKph: json["day"]["maxwind_kph"] ?? 0.0,
      avghumidity: json["day"]["avghumidity"] ?? 0.0,
      date: json["date"],
      condition: ConditionModel.fromJson(json["day"]["condition"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "mintemp_c": minTempInC,
        "maxtemp_c": maxTempInC,
        "mintemp_f": minTempInF,
        "maxtemp_f": maxTempInF,
        "maxwind_mph": maxWindInMph,
        "maxwind_kph": maxWindInKph,
        "avghumidity": avghumidity,
        "condition": condition.toJson(),
        "date": date,
      };

  ForecastdayEntity toEntity() => ForecastdayEntity(
        minTempInC: minTempInC,
        maxTempInC: maxTempInC,
        minTempInF: minTempInF,
        maxTempInF: maxTempInF,
        maxWindInMph: maxWindInMph,
        maxWindInKph: maxWindInKph,
        avghumidity: avghumidity,
        condition: condition.toEntity(),
        date: date,
      );
}
