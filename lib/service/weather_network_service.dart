import 'package:weather/model/weather.dart';
import "package:http/http.dart" as http;
import 'dart:convert' as convert;

import 'env_veriable.dart';

class WeatherNetworkService {
  static Future<Weather> getWeatherData(cityName) async {
    String openWeatherUrl =
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${Environment.apiKey}";

    var response = await http.get(openWeatherUrl);
    await Future.delayed(Duration(seconds: 2));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return Weather.fromJson(jsonResponse);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
