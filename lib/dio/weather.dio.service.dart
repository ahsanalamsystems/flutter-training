import 'package:dio/dio.dart';
import 'package:lecture_one/model/weather.model.dart';

class WeatherDioService {
  final dio = Dio();

  Future<WeatherModel> getWeatherUpdate() async {
    try {
      const API =
          'http://api.weatherapi.com/v1/forecast.json?key=59568f8a67684547a58143314231711&q=24.8607,67.0011&days=7';
      final response = await dio.get(API);
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
