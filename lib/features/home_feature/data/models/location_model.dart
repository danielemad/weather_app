import '../../domain/entities/location_entity.dart';

class LocationModel {
  String cityName;
  String country;
  String localTime;

  LocationModel({
    required this.cityName,
    required this.country,
    required this.localTime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      cityName: json["name"] ?? "",
      country: json["country"] ?? "",
      localTime: json["localtime"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": cityName,
        "country": country,
        "localtime": localTime,
      };
  LocationEntity toEntity() => LocationEntity(
        cityName: cityName,
        country: country,
        localTime: localTime,
      );
}
