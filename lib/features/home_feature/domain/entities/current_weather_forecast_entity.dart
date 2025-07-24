import "forecastday_entity.dart";
import "condition_entity.dart";
import "location_entity.dart";

class CurrentWeatherForecastEntity {
  num tempInC;
  num tempInF;
  num windSpeedInMph;
  num windSpeedInKph;
  num humidty;
  ConditionEntity condition;
  LocationEntity location;
  Map<String, ForecastdayEntity> forecastdays;

  CurrentWeatherForecastEntity({
    required this.tempInC,
    required this.tempInF,
    required this.windSpeedInMph,
    required this.windSpeedInKph,
    required this.humidty,
    required this.condition,
    required this.location,
    required this.forecastdays,
  });
}
