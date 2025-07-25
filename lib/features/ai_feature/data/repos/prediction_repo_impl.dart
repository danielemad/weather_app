import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/prediction.dart';
import '../../domain/repos/prediction_repo.dart';
import '../datasources/prediction_remote_datesource.dart';

class PredictionRepoImpl implements PredictionRepo{

  PredictionRemoteDatesource datasource;

  PredictionRepoImpl(
     this.datasource
  );


  @override
  Future<Either<Failure, Prediction>> getPrediction(List<int> features) async {

    try{
     final res = await datasource.getPrediction(features);
     return Right(res.toEntity());
    }
    catch(e){
      return Left(
        Failure(e.toString())
      );
    }

  }


}