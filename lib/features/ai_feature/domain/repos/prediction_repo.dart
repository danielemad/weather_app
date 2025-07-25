import 'package:dartz/dartz.dart';


import '../../../../core/exceptions/failure.dart';
import '../entities/prediction.dart';

abstract class PredictionRepo {

  Future<Either<Failure, Prediction>> getPrediction(List<int> features);

}