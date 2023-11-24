class API {
  static const String _host = "http://localhost:3000/";

  static const String weather = "${_host}weather";
  static const String todo = "${_host}todo";
  static const String products = "${_host}products";

  static const String weatherAPI =
      'http://api.weatherapi.com/v1/forecast.json?key=7bc0266d170f4e33b26120557232311&q=24.8607,67.0011&days=7';

  static const String users = "http://jsonplaceholder.typicode.com/users";
}
