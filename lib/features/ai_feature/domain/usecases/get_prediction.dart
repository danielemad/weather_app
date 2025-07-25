import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/prediction.dart';
import '../repos/prediction_repo.dart';

class GetPrediction {

  PredictionRepo repo;
  GetPrediction({required this.repo});

  Future<Either<Failure , Prediction>> call(List<int> features) async {
    return await repo.getPrediction(features);

  }
}