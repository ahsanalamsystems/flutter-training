import 'dart:convert';
import 'package:lecture_one/constant/api.constant.dart';
import 'package:lecture_one/model/weather.model.dart';
import 'package:http/http.dart' as http;

class WeatherHTTPService {
  Future<WeatherModel> getWeatherUpdate() async {
    try {
      final response = await http.get(Uri.parse(API.weatherAPI));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        // print('----------------- HTTP ---------------------');
        // print(jsonData);
        // print('--------------------------------------------');

        return WeatherModel.fromJson(jsonData);
      } else {
        return WeatherModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
