import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/current_weather_forecast_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, CurrentWeatherForecastEntity>>
      getWeatherForecastForAWeek(double lat, double lng);
  getWeatherForecastForToday();
  getWeatherForecastAt();
}
