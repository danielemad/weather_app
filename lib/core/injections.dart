import 'package:get_it/get_it.dart';
import 'package:weather_app/features/ai_feature/data/datasources/prediction_remote_datesource.dart';
import 'package:weather_app/features/ai_feature/data/repos/prediction_repo_impl.dart';
import 'package:weather_app/features/ai_feature/domain/repos/prediction_repo.dart';
import '../features/auth_feature/data/datasource/auth_remote_datasource.dart';
import '../features/auth_feature/data/repositories/auth_repo_implementation.dart';
import '../features/auth_feature/domain/repositories/auth_repo.dart';
import '../features/home_feature/data/datasources/home_remote_datasource.dart';
import '../features/home_feature/data/repos/home_repo_impl.dart';
import '../features/home_feature/domain/repos/home_repo.dart';

GetIt sl = GetIt.instance;


void init(){

  sl.registerSingleton<AuthRemoteDatasource>(AuthRemoteDatasource());
  sl.registerSingleton<AuthRepo>(AuthRepoImplementation(sl<AuthRemoteDatasource>()));

  sl.registerSingleton<HomeRemoteDatasource>(HomeRemoteDatasource());
  sl.registerSingleton<HomeRepo>(HomeRepoImpl(sl<HomeRemoteDatasource>()));

  sl.registerSingleton<PredictionRemoteDatesource>(PredictionRemoteDatesource());
  sl.registerSingleton<PredictionRepo>(PredictionRepoImpl(sl<PredictionRemoteDatesource>()));



}