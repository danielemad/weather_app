import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injections.dart';
import '../../domain/repos/prediction_repo.dart';
import '../../domain/usecases/get_prediction.dart';
import 'prediction_states.dart';

class PredictionCubit extends Cubit<PredictionStates>{
  PredictionCubit():super(PredictionStates());
    final  GetPrediction _getPrediction = GetPrediction(repo: sl<PredictionRepo>());

  void predict(List<int> features) async {

    emit(PredctionLoading());
    final result =  await _getPrediction(features);

    result.fold(
      (failure) => emit(PredctionFailure(failure)),
      (prediction) => emit(PredctionSuccess(prediction))
    );


  }



}