import 'dart:convert';
import 'package:lecture_one/model/weather.model.dart';
import 'package:http/http.dart' as http;

class WeatherHTTPService {
  Future<WeatherModel> getWeatherUpdate() async {
    try {
      const API =
          'http://api.weatherapi.com/v1/forecast.json?key=59568f8a67684547a58143314231711&q=24.8607,67.0011&days=7';
      final response = await http.get(Uri.parse(API));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return WeatherModel.fromJson(jsonData);
      } else {
        return WeatherModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
