import '../../../../../core/exceptions/failure.dart';
import '../../../domain/entities/current_weather_forecast_entity.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  CurrentWeatherForecastEntity forecastEntity;

  HomeSuccess(this.forecastEntity);
}

class HomeFailure extends HomeState {
  Failure f;

  HomeFailure(this.f);
}
