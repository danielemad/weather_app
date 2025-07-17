import "condition_entity.dart";

class ForecastdayEntity {
  num minTempInC;
  num maxTempInC;
  num minTempInF;
  num maxTempInF;
  num maxWindInMph;
  num maxWindInKph;
  num avghumidity;
  ConditionEntity condition;
  String date;

  ForecastdayEntity({
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
}
