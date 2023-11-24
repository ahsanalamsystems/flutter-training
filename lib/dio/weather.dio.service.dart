import 'package:dio/dio.dart';
import 'package:lecture_one/constant/api.constant.dart';
import 'package:lecture_one/model/weather.model.dart';

class WeatherDioService {
  final dio = Dio();

  Future<WeatherModel> getWeatherUpdate() async {
    try {
      final response = await dio.get(API.weatherAPI);
      if (response.statusCode == 200) {
        // print('----------------- DIO ---------------------');
        // print(response.data);
        // print('--------------------------------------------');

        return WeatherModel.fromJson(response.data);
      }
      return WeatherModel();
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
