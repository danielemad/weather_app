import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/current_weather_forecast_entity.dart';
import '../repos/home_repo.dart';

class GetWeatherForecastForAWeek {
  HomeRepo repo;
  GetWeatherForecastForAWeek({
    required this.repo,
  });

  Future<Either<Failure, CurrentWeatherForecastEntity>> call(
      double lat, double lng) async {
    return await repo.getWeatherForecastForAWeek(lat, lng);
  }
}
