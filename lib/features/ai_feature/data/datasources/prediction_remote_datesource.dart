import 'dart:convert';
import "package:http/http.dart" as http;
import '../models/prediction_model.dart';

class PredictionRemoteDatesource {

  final _baseURL = "http://10.0.2.2:5001/predict";

  Future<PredictionModel> getPrediction(List<int> features)async{

    Uri uri = Uri.parse(_baseURL);


    final res = await http.post(
      uri,
      headers: {
        "content-type":"application/json"
      },
      body: jsonEncode(PredictionModel(features: features).toJson())
    );

    final data = jsonDecode(res.body);
    return PredictionModel.fromJson(data);
  
  }
}