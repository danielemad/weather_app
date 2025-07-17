import "../../domain/entities/current_weather_forecast_entity.dart";
import "forecastday_model.dart";
import "location_model.dart";
import "condition_model.dart";

class CurrentWeatherForecastModel {
  num tempInC;
  num tempInF;
  num windSpeedInMph;
  num windSpeedInKph;
  num humidty;
  ConditionModel condition;
  LocationModel location;
  Map<String, ForcastdayModel> forecastdays;

  CurrentWeatherForecastModel({
    required this.tempInC,
    required this.tempInF,
    required this.windSpeedInMph,
    required this.windSpeedInKph,
    required this.humidty,
    required this.condition,
    required this.location,
    required this.forecastdays,
  });

  factory CurrentWeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherForecastModel(
        tempInC: json["current"]["temp_c"] ?? 0.0,
        tempInF: json["current"]["temp_f"] ?? 0.0,
        windSpeedInMph: json["current"]["wind_mph"] ?? 0.0,
        windSpeedInKph: json["current"]["wind_kph"] ?? 0.0,
        humidty: json["current"]["humidity"] ?? 0.0,
        condition: ConditionModel.fromJson(json["current"]["condition"]),
        location: LocationModel.fromJson(json["location"]),
        forecastdays: {
          for (var day in (json["forecast"]["forecastday"] as List))
            day["date"]: ForcastdayModel.fromJson(day)
        });
  }

  Map<String, dynamic> toJson() => {
        "temp_c": tempInC,
        "temp_f": tempInF,
        "wind_mph": windSpeedInMph,
        "wind_kph": windSpeedInKph,
        "humidity": humidty,
        "condition": condition.toJson(),
        "location": location.toJson(),
        "forecast": {
          "forecastday": [
            for (var day in forecastdays.entries) day.value.toJson()
          ]
        }
      };

  CurrentWeatherForecastEntity toEntity() => CurrentWeatherForecastEntity(
          tempInC: tempInC,
          tempInF: tempInF,
          windSpeedInMph: windSpeedInMph,
          windSpeedInKph: windSpeedInKph,
          humidty: humidty,
          condition: condition.toEntity(),
          location: location.toEntity(),
          forecastdays: {
            for (var item in forecastdays.entries)
              item.key: item.value.toEntity()
          });
}
