import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/current_weather_forecast_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../datasources/remote_datasource.dart';

class HomeRepoImpl implements HomeRepo {
  RemoteDataSource _remoteDataSource = RemoteDataSource();

  HomeRepoImpl(this._remoteDataSource);

  @override
  getWeatherForecastAt() {
    // TODO: implement getWeatherForecastAt
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CurrentWeatherForecastEntity>>
      getWeatherForecastForAWeek(double lat, double lng) async {
    try {
      final forecast =
          await _remoteDataSource.getWeatherForecastForWeek(lat, lng);

      return Right(forecast.toEntity());
    } catch (e) {
      return Left(Failure("some error occured"));
    }
  }

  @override
  getWeatherForecastForToday() {
    // TODO: implement getWeatherForecastForToday
    throw UnimplementedError();
  }
}
