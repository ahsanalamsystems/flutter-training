// ignore_for_file: non_constant_identifier_names

class WeatherModel {
  LocationModel? location;
  CurrentModel? current;
  ForecastModel? forecast;

  WeatherModel({this.location, this.current, this.forecast});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null,
      current: json['current'] != null
          ? CurrentModel.fromJson(json['current'])
          : null,
      forecast: json['forecast'] != null
          ? ForecastModel.fromJson(json['forecast'])
          : null,
    );
  }
}

class LocationModel {
  late String name;
  late String region;
  late String country;

  LocationModel(this.name, this.region, this.country);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      json['name'],
      json['region'],
      json['country'],
    );
  }
}

class CurrentModel {
  double temp_c;
  int is_day;
  double humidity;
  int cloud;
  double wind_kph;
  ConditionModel condition;

  CurrentModel(this.temp_c, this.is_day, this.humidity, this.cloud,
      this.wind_kph, this.condition);

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      (json['temp_c'] as num).toDouble(),
      json['is_day'],
      (json['humidity'] as num).toDouble(),
      json['cloud'],
      (json['wind_kph'] as num).toDouble(),
      ConditionModel.fromJson(json['condition']),
    );
  }
}

class ForecastModel {
  List<ForecastdayModel> forecastday;

  ForecastModel(this.forecastday);

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    var forecastdayList = json['forecastday'] as List;
    List<ForecastdayModel> forecastday =
        forecastdayList.map((item) => ForecastdayModel.fromJson(item)).toList();
    return ForecastModel(forecastday);
  }
}

class ForecastdayModel {
  DateTime date;
  DayModel day;

  ForecastdayModel(this.date, this.day);

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) {
    return ForecastdayModel(
      DateTime.parse(json['date_epoch'].toString()),
      DayModel.fromJson(json['day']),
    );
  }
}

class DayModel {
  double avgtemp_c;
  double maxwind_kph;
  double avghumidity;
  ConditionModel condition;

  DayModel(this.avgtemp_c, this.maxwind_kph, this.avghumidity, this.condition);

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      (json['avgtemp_c'] as num).toDouble(),
      (json['maxwind_kph'] as num).toDouble(),
      (json['avghumidity'] as num).toDouble(),
      ConditionModel.fromJson(json['condition']),
    );
  }
}

class ConditionModel {
  String text;
  String icon;

  ConditionModel(this.text, this.icon);

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      json['text'],
      json['icon'],
    );
  }
}
