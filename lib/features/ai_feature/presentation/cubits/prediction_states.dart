import '../../../../core/exceptions/failure.dart';
import '../../domain/entities/prediction.dart';

class PredictionStates {}

class PredctionInitial extends PredictionStates {}
class PredctionLoading extends PredictionStates {}
class PredctionSuccess extends PredictionStates {
  Prediction prediction;

  PredctionSuccess(this.prediction);
}
class PredctionFailure extends PredictionStates {

  Failure failure;
  PredctionFailure(this.failure);

}