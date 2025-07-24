import 'package:http/http.dart' as http;
import "dart:convert";

import '../models/current_weather_forecast_model.dart';

class RemoteDataSource {
  String _key = "e7160491664542a8868200615251407";
  String _baseURL = "https://api.weatherapi.com/v1/forecast.json?";

  Future<CurrentWeatherForecastModel> getWeatherForecastForWeek(
      double lat, double lng) async {
    String url = _baseURL + "q=$lat,$lng&days=7&hour=24&key=$_key";

    Uri uri = Uri.parse(url);
    final res = await http.get(
      uri,
      headers: {
        "content-type": "application/json",
      },
    );

    Map<String, dynamic> data = json.decode(res.body);
    return CurrentWeatherForecastModel.fromJson(data);
  }
}
