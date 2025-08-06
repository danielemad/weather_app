import '../../domain/entities/prediction.dart';

class PredictionModel {

  List features;

  PredictionModel({required this.features});

  factory PredictionModel.fromJson(Map<String , dynamic> json){
    return PredictionModel(
      features: json["prediction"] ?? []
    );
  }


  Map<String , dynamic> toJson() =>{
    "features":features
  };

  Prediction toEntity(){
    return Prediction(
      features[0] == 1 ?  "you can go out" : "you can't go out"
    );
  }


}